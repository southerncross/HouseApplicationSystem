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

  function display_data(data) {
    var blackboard = $('.query-result');
    var houses = [];
    var buildings = {};
    var house_types = {};
    var sites = {};
    var tmp = [];

    blackboard.empty();
    houses = data['house'];
    tmp = data['house_type']
    $(tmp).each(function(i, e) {
      house_types[e.id] = e;
    });
    tmp = data['building'];
    $(tmp).each(function(i, e) {
      buildings[e.id] = e;
    });
    tmp = data['site'];
    $(tmp).each(function(i, e) {
      sites[e.id] = e;
    });

    $(houses).each(function(i, e) {
      var house_type = house_types[e.house_type_id].name;
      var site = sites[buildings[e.building_id].site_id].name;
      var area = house_types[e.house_type_id].area;
      var building = buildings[e.building_id].name;
      var unit = e.unit;
      var floor = e.floor;
      var door = e.door;
      var description = house_types[e.house_type_id].description;

      blackboard.append('<tr><td>' + house_type +
                        '</td><td>' + site +
                        '</td><td>' + area +
                        '</td><td>' + building +
                        '</td><td>' + unit +
                        '</td><td>' + floor +
                        '</td><td>' + door +
                        '</td><td>' + description +
                        '</td><td><button class="am-btn am-btn-primary">关注</button></td></tr>');
    });
  }
});
