/* Author:

*/

$(document).ready(function() {

  $('a').smoothScroll();

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

