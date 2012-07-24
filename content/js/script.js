/* Author:

*/

$(document).ready(function() {

  // Kerning
  $('#ourvalues h2').lettering();
  $('.motto h1').lettering('words').children('span').lettering();
  $('.teamintro h1').lettering();
  $('#meetgeungle h2').lettering();


  $('a').smoothScroll();
  
  $('.post img').baseline(26);

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

});
