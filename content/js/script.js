window.Pentandra = window.Pentandra || {};

Pentandra.Kerning = (function() {

  return {
    init: function() {

      $('#ourvalues h2').lettering();
      $('.motto h1').lettering('words').children('span').lettering();
      $('.teamintro h1').lettering();

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
            scrollTarget: 'main'
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

  var setupPermalinks = function() {
    $(".permalinks input").focus(function(e) {
      $(this)
        .select()
        .one('mouseup', function(e) { e.preventDefault(); });
    });
  };

  return {
    init: function(target) {
      setupPermalinks();
    }
  };

}());

Pentandra.Search = (function() {

  function unique(arrayName) {
    var newArray = new Array();
    label: for (var i = 0; i < arrayName.length; i++) {
      for (var j = 0; j < newArray.length; j++) {
        if (newArray[j] == arrayName[i])
        continue label;
      }

      newArray[newArray.length] = arrayName[i];
    }

    return newArray;
  }

  function search(query, callback) {
    if (!Pentandra.index) {
      throw new Error("Pentandra.index has not been loaded! Cannot search.");
    }

    var terms = $.trim(query).replace(/[\W\s_]+/m,' ').toLowerCase().split(/\s+/);
    var matching_ids = null;
    for (var i = 0; i < terms.length; i++) {
      var term = terms[i];
      var exactmatch = Pentandra.index.terms[term] || [];
      var approxmatch = Pentandra.index.approximate[term] || [];
      var ids = unique(exactmatch.concat(approxmatch));
      if (matching_ids) {
        matching_ids = $.grep(matching_ids, function(id) {
          return ids.indexOf(id) != -1;
        });
      } else {
        matching_ids = ids;
      }
    }
    callback($.map(matching_ids, function(id){ return Pentandra.index.items[id]; }))
  };

  return {
    search: search
  };

}());

$(document).ready(function() {

  $("main img.retina").retina({ suffix: "@2x" });

  Pentandra.Kerning.init();
  Pentandra.Scrolling.init("main a");
  Pentandra.Social.init('#share');

  AccessifyHTML5();
});

$(window).load(function() {
  $('.bd').emphasis();
});
