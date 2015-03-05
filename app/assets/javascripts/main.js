jQuery(function($) {

  $(window).load(function() {
    // TODO
  });

  $(document).ready(function() {
    $('.img-type').tooltip({
      title: '点击可查看大图'
    });

    var location2color = {
      Ec: '#0080ff',
      Ecc: '#ee3a8c',
      F: '#ffd306',
      G: '#82d900',
      Gc: '#8600ff'
    };

    $.each(['Ecc', 'Ec', 'F', 'G', 'Gc'], function(i, id) {
      (function() {
        var svg = d3.select('#svg-map svg');
        $('#li-' + id).mouseenter(function() {
          $(this).css('background-color', '#f8f8f8');
          svg.select('#' + id).style('fill-opacity', '0.8');
        }).mouseleave(function() {
          svg.select('#' + id).style('fill-opacity', '0');
          $(this).css('background-color', '#fff');
        });

        /*
        svg.select('#' + id).on('mouseover', function() {
          d3.select(this).style('fill-opacity', '0.8');
          $('#li-' + id).css('background-color', '#f8f8f8');
        }).on('mouseout', function() {
          d3.select(this).style('fill-opacity', '0');
          $('#li-' + id).css('background-color', '#fff');
        }).on('click', function() {
          $('#my-popup').modal();
        });
         */
      }());

      $('#btn-' + id).on('click', function() {
        var svg = d3.select('#svg-lot svg');
        svg.selectAll('rect').style('fill-opacity', '0');
        svg.selectAll('.wuA').style('fill-opacity', '1');
        $('#my-popup').modal();
      });
    });

    $('.my-slide').on('click', function() {
      $('#img-popup').modal();
    });


    $(['Ecc', 'Ec', 'F', 'G', 'Gc']).each(function(i, id) {
      var svg = d3.select('#sites-svg-map svg');
      svg.select('#' + id).on('mouseover', function() {
        d3.select(this).style('fill-opacity', '0.8');
      }).on('mouseout', function() {
        d3.select(this).style('fill-opacity', '0');
      }).on('click', function() {
        window.location.href='sites/' + (i + 1);
      });
    });

    d3.select('#sites-svg svg g').selectAll('.border')
      .on('mouseover', function() {
        d3.select(this).style('opacity', '1');
      })
      .on('mouseout', function() {
        d3.select(this).style('opacity', '0');
      })
      .on('click', function() {
        $('#my-modal2').modal();
      });

    $('#building-chenB').on('click', function() {
      $('#my-modal').modal();
    });

        $('#type-image').on('click', function() {
      $('#img-popup').modal();
    });

    $('#option-room').click(function() {
      $('.section-room').removeClass('am-hide');
      $('.section-area').addClass('am-hide');
    });

    $('#option-area').click(function() {
      $('.section-room').addClass('am-hide');
      $('.section-area').removeClass('am-hide');
    });

    $(['wuA', 'wuB', 'chenA', 'chenB', 'ziA']).each(function(i, id) {
      var svg = d3.select('#sites-svg');
      $('#badge-' + id).mouseenter(function() {
        svg.selectAll('rect').style('fill-opacity', 0);
        svg.selectAll('.' + id).style('fill-opacity', 1);
      }).mouseleave(function() {
        svg.selectAll('rect').style('fill-opacity', 1);
      });
    });

    $('#welcome-1').click(function() {
      $('#page-1').removeClass('am-hide');
      $('#page-2').addClass('am-hide');
    });

    $('#welcome-2').click(function() {
      $('#page-1').addClass('am-hide');
      $('#page-2').removeClass('am-hide');
    });
  });
});
