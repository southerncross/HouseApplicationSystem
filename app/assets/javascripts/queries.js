$(function() {
  var QUERY_KEYS = ['house-type', 'site', 'area', 'floor', 'building'];
  var QUERY_URL = 'queries/select';

  $('.query').click(function () {
    if ($(this).hasClass('am-active')) {
      $(this).removeClass('am-active');
      $('#' + $(this).attr('id') + '-banner').fadeOut();
    }
    else {
      $(this).addClass('am-active');
      $('#' + $(this).attr('id') + '-banner').fadeIn();
    }

    query_and_display(QUERY_URL,
                      collect_queries(QUERY_KEYS),
                      {display_callback: display_data});
  });

  $('.care').click(function() {
    // TODO
  });

  function collect_queries(keys) {
    var queries = {};

    $(keys).each(function(i, e) {
      queries[e.replace('-', '_')] = $('.query-' + e + '.am-active').map(function() {
        return $(this).attr('id').split('-').pop();
      }).get();
    });

    return queries;
  }

  function query_and_display(url, queries, option) {
    var display = option.display_callback;

    $.ajax(url, {
      type: 'post',
      dataType: 'json',
      data: {query: queries}
    }).done(function(data, textStatus, jqXHR) {
      display(data);
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.log(textStatus);
    });
  }

  function array2hash(a, key) {
    var res = {};

    $(a).each(function(i, e) {
      res[e[key]] = e;
    });

    return res;
  }

  function display_data(data) {
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
            '<td><button class="am-btn am-btn-' + (iscared ? 'danger' : 'success') + ' care" id="' + e.id + '">' +
            (iscared ? '取消关注' : '关注') +
            '</button></td>' +
            '</tr>';
      blackboard.append(content);
    });
  }
});
