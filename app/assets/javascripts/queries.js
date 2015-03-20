$(function() {
  var QUERY_KEYS = ['house-type', 'site', 'area', 'floor'];
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
  });

  /*
  $('.query-house-type').click(function() {
    if ($(this).hasClass('am-active')) {
      $(this).removeClass('am-active');
      $('#house-type-banner-' + $(this).attr('id').split('-').pop()).fadeOut();
    }
    else {
      $(this).addClass('am-active');
      $('#house-type-banner-' + $(this).attr('id').split('-').pop()).fadeIn();
    }
  });
   */

  $('.btn-query').click(function() {
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
      //display(data);
      console.log(data);
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.log(textStatus);
    });
  }

  /*
  $('.btn-query').click(function() {
    var queries = {};
    var house_type_ids = [];

    house_type_ids.push($('.query-house-type.am-active').map(function() {
      return $(this).attr('id').split('-').pop();
    }).get());
    queries['house_type_id'] = house_type_ids;

    // console.log(queries);

    $.ajax(
      'queries/select',
      {
        type: 'post',
        dataType: 'json',
        data: {query: queries}
      }).done(function(data, textStatus, jqXHR) {
        display_data(data);
      }).fail(function(jqXHR, textStatus, errorThrown) {
        console.log(textStatus);
      });
  });
   */

  function display_data(data) {
    var blackboard = $('.query-result');

    blackboard.empty();
    $(data).each(function(i, e) {
      e = e[0];
      blackboard.append('<tr><td>' + e.name + '</td><td>' + e.description + '</td><td>' + e.area + '</td><td>' + e.amount + '</td></tr>');
      // console.log(e[0]);
    });
  }
});
