/* Author:

*/

$(document).ready(function() {

  $('a').smoothScroll();

  if ($.fn.sharrre) {
    $('#share').sharrre({

      share: {
        googlePlus: true,
        facebook: true,
        twitter: true
      },

      buttons: {
        googlePlus: { size: 'tall' },
        facebook: { layout: 'box_count' },
        twitter: { count: 'vertical', via: 'PentandraInc' }
      },

      urlCurl: '',

      enableHover: false,
      enableCounter: false,
      enableTracking: true
      
    });

    $('.share').click(function() {
      $('#share').toggle();
    });

  }

  $('a[rel="external"]').click(function() {
    window.open( $(this).attr('href') );
    return false;
  });
  
});

$(window).load(function() {

  // Scroll to #main on mobile phones after page load
  if ($(window).width() < 767) {
    $.smoothScroll({
      speed: 800,
      scrollTarget: '#main'
    });
  }

});
