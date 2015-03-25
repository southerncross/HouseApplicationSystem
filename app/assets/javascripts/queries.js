$(function() {
  var QUERY_KEYS = ['house-type', 'site', 'area', 'floor', 'building'];
  var ADD_ATTENTION_URL = 'queries/add_attention';
  var REMOVE_ATTENTION_URL = 'queries/remove_attention';
  var QUERY_URL = 'queries/select';
  var LIMIT = 50;
  var _queries = {};
  var _offset = 0;

  $('.query').click(function () {
    if ($(this).hasClass('am-active')) {
      $(this).removeClass('am-active');
      $('#' + $(this).attr('id') + '-banner').fadeOut();
    }
    else {
      $(this).addClass('am-active');
      $('#' + $(this).attr('id') + '-banner').fadeIn();
    }

    queryAndDisplay(QUERY_URL,
                    collectQueries(QUERY_KEYS),
                    {callback: showData});
  });

  function addAttention() {
    console.log('add');
    var house_id = $(this).attr('id');

    $.ajax(ADD_ATTENTION_URL, {
      type: 'post',
      dataType: 'json',
      data: {house_id: house_id}
    }).done(function(data, textStatus, jqXHR) {
      console.log(data);
      $('#' + house_id)
        .html('取消关注')
        .removeClass('am-btn-success')
        .addClass('am-btn-danger')
        .parent().prev().html(data.count);
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.log(textStatus);
    });
    $(this).unbind('click');
    $(this).click(removeAttention);
  }

  function removeAttention() {
    console.log('remove');
    var house_id = $(this).attr('id');

    $.ajax(REMOVE_ATTENTION_URL, {
      type: 'delete',
      dataType: 'json',
      data: {house_id: house_id}
    }).done(function(data, textStatus, jqXHR) {
      $('#' + house_id)
        .html('关注')
        .removeClass('am-btn-danger')
        .addClass('am-btn-success')
        .parent().prev().html(data.count);
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.log(textStatus);
    });
    $(this).unbind('click');
    $(this).click(addAttention);
  }

  function collectQueries(keys) {
    _queries = {};
    _offset = 0;
    $(keys).each(function(i, e) {
      _queries[e.replace('-', '_')] = $('.query-' + e + '.am-active').map(function() {
        return $(this).attr('id').split('-').pop();
      }).get();
    });
    _queries['limit'] = LIMIT;
    _queries['offset'] = _offset;

    return _queries;
  }

  function queryAndDisplay(url, queries, option) {
    var display = option.callback;

    $.ajax(url, {
      type: 'post',
      dataType: 'json',
      data: queries
    }).done(function(data, textStatus, jqXHR) {
      display(data);
      $('.care').click(addAttention);
      $('.not-care').click(removeAttention);
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.log(textStatus);
    });
  }

  function showNextBunchOfData() {
    _offset += LIMIT;
    queryAndDisplay(QUERY_URL, _queries, {callback: showData});
  }

  function array2hash(a, key) {
    var res = {};

    $(a).each(function(i, e) {
      res[e[key]] = e;
    });

    return res;
  }

  function showData(data) {
    var blackboard = $('.query-result');
    var houses = data['house'];
    var buildings = array2hash(data['building'], 'id');
    var house_types = array2hash(data['house_type'], 'id');
    var sites = array2hash(data['site'], 'id');
    var attentions = array2hash(data['attention'], 'house_id');

    blackboard.empty();

    $(houses).each(function(i, e) {
      var house_type = house_types[e.house_type_id].name;
      var site = sites[buildings[e.building_id].site_id].name;
      var area = house_types[e.house_type_id].area;
      var building = buildings[e.building_id].name;
      var unit = e.unit;
      var floor = e.floor;
      var door = e.door;
      var description = house_types[e.house_type_id].description;
      var attention_count = e.attention_count;
      var iscared = attentions.hasOwnProperty(e.id);

      var content =
            '<tr>' +
            '<td>' + house_type      + '</td>' +
            '<td>' + site            + '</td>' +
            '<td>' + area            + '</td>' +
            '<td>' + building        + '</td>' +
            '<td>' + unit            + '</td>' +
            '<td>' + floor           + '</td>' +
            '<td>' + door            + '</td>' +
            '<td>' + description     + '</td>' +
            '<td>' + attention_count + '</td>' +
            '<td><button class="am-btn am-btn-' + (iscared ? 'danger not-care' : 'success care') + '" id="' + e.id + '">' +
            (iscared ? '取消关注' : '关注') +
            '</button></td>' +
            '</tr>';
      blackboard.append(content);
    });

    $("#stupid-table").stupidtable();
  }
});
