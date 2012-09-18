/* Author:

*/

window.Pentandra = {};

Pentandra.Kerning = (function() {

  return {
    init: function() {

      $('#ourvalues h2').lettering();
      $('.motto h1').lettering('words').children('span').lettering();
      $('.teamintro h1').lettering();
      $('#meetgeungle h2').lettering();

    }
  };

}());

Pentandra.Scrolling = (function() {

  var mobileWidth = 768;

  function setupScrollingFor(elem) {

    $(elem).smoothScroll({
      afterScroll: function(opts) {
        location.hash = opts.scrollTarget;
      }
    });
  
  }

  function smallMenuInUse() {
    return $(window).width() < mobileWidth;
  }

  function scrollWhenTheHashChanges() {

    $(window).hashchange(function() {
      var hash = location.hash;

      if (!hash && smallMenuInUse()) {

        // Scroll to the top of the main content
        $.smoothScroll({
          scrollTarget: '#main'
        });

      } else {

        if (document.getElementById(hash.substring(1))) {
          $.smoothScroll({
            scrollTarget: hash
          });
        }

      }

      return false;

    });

  }

  return {

    init: function() {
      setupScrollingFor('a');
      scrollWhenTheHashChanges();

      this.trigger();
    },

    trigger: function() {
      $(window).hashchange();
    }

  };

}());

Pentandra.Social = (function() {

  var opts = {

    share: {
      googlePlus: true,
      twitter: true,
      linkedin: true,
      facebook: true
    },

    buttons: {
      linkedin: { counter: 'right' },
      twitter: { via: 'PentandraInc', related: 'geungle' }
    },

    urlCurl: '',

    enableHover: false,
    enableCounter: false,
    enableTracking: true
    
  };

  return {
    init: function(target) {
      if ($.fn.sharrre) {
        $(target).sharrre(opts);
      }
    }
  };

}());


$(document).ready(function() {

  Pentandra.Kerning.init();
  Pentandra.Scrolling.init();
  Pentandra.Social.init('#share');

  AccessifyHTML5();
});

// Wait until after images have loaded to run baselinejs.
$(window).load(function() {
  $('.post img').baseline(26);
});
