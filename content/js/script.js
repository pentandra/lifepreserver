---
is_hidden: true
---

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

  var mobileWidth = 768, previousPosition = null;

  function setupScrollingFor(elem) {

    $(elem).smoothScroll({
      beforeScroll: function(opts) {
        previousPosition = $(window).scrollTop();
      },
      afterScroll: function(opts) {
        location.hash = unescapeSelector(opts.scrollTarget);
      }
    });
  
  }

  function smallMenuInUse() {
    return $(window).width() < mobileWidth;
  }

  function scrollWhenTheHashChanges() {

    $(window).hashchange(function() {
      var hash = location.hash;

      if (!hash) {
        
        // If there is a previous position, move there
        if ($.isNumeric(previousPosition)) {
          $.smoothScroll(previousPosition);
        } 
        
        // If we're coming to the page for the first time and we are on a
        // mobile device, scroll down past the menu to the main content.
        else if (smallMenuInUse()) {

          // Scroll to the top of the main content
          $.smoothScroll({
            scrollTarget: '#main'
          });
        }

      } else {

        if (document.getElementById(hash.substring(1))) {
          $.smoothScroll({
            scrollTarget: escapeSelector(hash)
          });
        }

      }

      return false;

    });

  }

  function setupScrollingToTop() {
    $(".backtotop").click(function() {
      $.smoothScroll(0);

      return false;
    });
  }

  function escapeSelector(str) {
    return str.replace(/(:|\.)/g, '\\$1');
  }

  function unescapeSelector(str) {
    return str.replace(/\\/g, '');
  }

  return {

    init: function(elem) {
      setupScrollingFor(elem);
      setupScrollingToTop();
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

  $("#main img.retina").retina({ suffix: "@2x" });

  Pentandra.Kerning.init();
  Pentandra.Scrolling.init("#main a");
  Pentandra.Social.init('#share');

  AccessifyHTML5();
});

// Wait until after images have loaded to run baselinejs.
$(window).load(function() {
  $('.post img').baseline(26);
  $('.bd').emphasis();
});
