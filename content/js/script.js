/* Author:

*/

$(document).ready(function() {

  // Kerning
  $('#ourvalues h2').lettering();
  $('.motto h1').lettering('words').children('span').lettering();
  $('.teamintro h1').lettering();
  $('#meetgeungle h2').lettering();


  $('a').smoothScroll({
    afterScroll: function(opts) {
      location.hash = opts.scrollTarget;
    }
  });
  
  if ($.fn.sharrre) {
    $('#share').sharrre({

      share: {
        googlePlus: true,
        twitter: true,
        linkedin: true,
        facebook: true
      },

      buttons: {
        linkedin: { counter: 'right' },
        twitter: { via: 'PentandraInc' }
      },

      urlCurl: '',

      enableHover: false,
      enableCounter: false,
      enableTracking: true
      
    });
  }

});

// Wait until after images have loaded to run baselinejs.
$(window).load(function() {
  $('.post img').baseline(26);
});
