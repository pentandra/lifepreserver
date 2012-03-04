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

  
});


$(document).ready(function() {

  function processResearch() {
    var process = $('#researchprocess');

    if (process) {
      var position = process.css('background-position-y');

      switch(position) {
        case "0px":
          position = "-138px";
          break;
        case "-138px":
          position = "-275px";
          break;
        default:
          position = "0px";
      }

      process.css('background-position-y', position);
    }
  }

  // set an interval
  setInterval(processResearch, 1000);

  processResearch();

});

