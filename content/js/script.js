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

  function setupScrollingFor(elem) {

    $(elem).smoothScroll({
      afterScroll: function(opts) {
        location.hash = opts.scrollTarget;
      }
    });
  
  }

  function scrollWhenTheHashChanges() {

    $(window).hashchange(function() {
      var hash = location.hash;

      $.smoothScroll({
        scrollTarget: hash
      });
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

});

// Wait until after images have loaded to run baselinejs.
$(window).load(function() {
  $('.post img').baseline(26);
});
