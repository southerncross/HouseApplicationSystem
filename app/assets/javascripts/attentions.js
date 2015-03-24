$(function() {
  var QUERY_URL = 'attentions/query'; // FIXME: This constant is deprecated.
  var DELETE_URL = 'attentions';
  var USER_ID = 1;
  var QUERY = {user_id: 1} // FIXME: This is constant is deprecated.

  // FIXME: This function is deprecated
  !function() {
    // query_and_display(QUERY_URL, QUERY, {display_callback: display_data});
  } ();

  $('.delete').click(function() {
    var btn = $(this);

    $.ajax(DELETE_URL, {
      type: 'delete',
      dataType: 'json',
      data: {
        house_id: $(this).attr('id'),
        user_id: USER_ID
      }
    }).done(function(data, textStatus, jqXHR) {
      btn.parent().parent().remove();
      $('#note-area').append(
        '<div class="am-alert"><button type="button" class="am-close" data-am-alert>&times;</button>已取消关注</div>'
      );
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.log(errorThrown);
    });
  });

  // FIXME: This function is deprecated
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

  function array2hash(a) {
    var res = {};

    $(a).each(function(i, e) {
      res[e.id] = e;
    });

    return res;
  }

  // FIXME: This function is deprecated
  function display_data(data) {
    var blackboard = $('.query-result');
    var houses = data['house'];
    var house_types = array2hash(data['house_type']);
    var buildings = array2hash(data['building']);
    var sites = array2hash(data['site']);

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

      blackboard.append(
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
          '<td><button class="am-btn am-btn-primary delete" id="' + e.id + '">取消关注</button></td>' +
        '</tr>');
    });
  }
});
