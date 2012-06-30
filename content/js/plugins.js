
// usage: log('inside coolFunc', this, arguments);
window.log = function(){
  log.history = log.history || [];   // store logs to an array for reference
  log.history.push(arguments);
  if(this.console) {
      arguments.callee = arguments.callee.caller;
      console.log( Array.prototype.slice.call(arguments) );
  }
};
(function(b){function c(){}for(var d="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","),a;a=d.pop();)b[a]=b[a]||c})(window.console=window.console||{});

/*! Copyright (c) 2011 Peter (Poetro) Galiba (http://poetro.hu/) MIT Licensed
 * Background position x or y
 */
(function(c){var b="background-position",d=c.camelCase;function a(g){var f="100%",i="0px",e={top:i,bottom:f,left:i,right:f};return e[g]||g}c.each(["x","y"],function(f,e){var g=d(b+"-"+e);c.cssHooks[g]={get:function(h){var i=c.css(h,b).split(/\s+/,2);return a(i[f])},set:function(h,i){var j=c.css(h,b).split(/\s+/,2);j[f]=a(i);c.style(h,b,j.join(" "))}};c.fx.step[g]=function(h){c.style(h.elem,h.prop,h.now)}})}(jQuery));

/*!
 * jQuery Smooth Scroll Plugin v1.4.2
 *
 * Date: Tue Feb 14 17:34:02 2012 EST
 * Requires: jQuery v1.3+
 *
 * Copyright 2010, Karl Swedberg
 * Dual licensed under the MIT and GPL licenses (just like jQuery):
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 *
 *
 *
*/
(function(b){function l(c){return c.replace(/^\//,"").replace(/(index|default).[a-zA-Z]{3,4}$/,"").replace(/\/$/,"")}function m(c){return c.replace(/(:|\.)/g,"\\$1")}var n=l(location.pathname),o=function(c){var e=[],a=false,d=c.dir&&c.dir=="left"?"scrollLeft":"scrollTop";this.each(function(){if(!(this==document||this==window)){var f=b(this);if(f[d]()>0)e.push(this);else{f[d](1);a=f[d]()>0;f[d](0);a&&e.push(this)}}});if(c.el==="first"&&e.length)e=[e.shift()];return e},p="ontouchend"in document;b.fn.extend({scrollable:function(c){return this.pushStack(o.call(this,{dir:c}))},firstScrollable:function(c){return this.pushStack(o.call(this,{el:"first",dir:c}))},smoothScroll:function(c){c=c||{};var e=b.extend({},b.fn.smoothScroll.defaults,c);this.die("click.smoothscroll").live("click.smoothscroll",function(a){var d={},f=b(this),h=location.hostname===this.hostname||!this.hostname,g=e.scrollTarget||(l(this.pathname)||n)===n,j=m(this.hash),i=true;if(!e.scrollTarget&&(!h||!g||!j))i=false;else{h=e.exclude;g=0;for(var k=h.length;i&&g<k;)if(f.is(m(h[g++])))i=false;h=e.excludeWithin;g=0;for(k=h.length;i&&g<k;)if(f.closest(h[g++]).length)i=false}if(i){a.preventDefault();b.extend(d,e,{scrollTarget:e.scrollTarget||j,link:this});b.smoothScroll(d)}});return this}});b.smoothScroll=function(c,e){var a,d,f,h=0;d="offset";var g="scrollTop",j={},i=false;f=[];if(typeof c==="number"){a=b.fn.smoothScroll.defaults;f=c}else{a=b.extend({},b.fn.smoothScroll.defaults,c||{});if(a.scrollElement){d="position";a.scrollElement.css("position")=="static"&&a.scrollElement.css("position","relative")}f=e||b(a.scrollTarget)[d]()&&b(a.scrollTarget)[d]()[a.direction]||0}a=b.extend({link:null},a);g=a.direction=="left"?"scrollLeft":g;if(a.scrollElement){d=a.scrollElement;h=d[g]()}else{d=b("html, body").firstScrollable();i=p&&"scrollTo"in window}j[g]=f+h+a.offset;b.isFunction(a.beforeScroll)&&a.beforeScroll.call(d,a);if(i){f=a.direction=="left"?[j[g],0]:[0,j[g]];window.scrollTo.apply(window,f)}else d.animate(j,{duration:a.speed,easing:a.easing,complete:function(){a.afterScroll&&b.isFunction(a.afterScroll)&&a.afterScroll.call(a.link,a)}})};b.smoothScroll.version="1.4.2";b.fn.smoothScroll.defaults={exclude:[],excludeWithin:[],offset:0,direction:"top",scrollElement:null,scrollTarget:null,beforeScroll:null,afterScroll:null,easing:"swing",speed:400}})(jQuery);

/*global jQuery */
/*!
* Baseline.js 1.0
*
* Copyright 2012, Daniel Eden http://daneden.me
* Released under the WTFPL license
* http://sam.zoy.org/wtfpl/
*
* Date: Wed June 20 11:39:00 2012 GMT
*/
(function( $ ) {

	$.fn.baseline = function(breakpoints) {

		// Set up our variables, like a good little developer
		var tall, newHeight, base, old = 0;

		return this.each(function(){
			var $this = $(this); // Set the images as objects

			var setbase = function(breakpoints) { // The fun starts here

				// Check if a single value or multiple breakpoints are given                
		                if (typeof breakpoints === 'number') {
		                    base = breakpoints;
		                } else if (typeof breakpoints === 'object') {
		                    // Loop through the breakpoints and check which baseline to apply
		                    for (key in breakpoints) {
		                    	var current = parseInt(key);
		                        if (document.width > current && current >= old) {
		                            base = breakpoints[key];
		                            old = current;
		                        }
		                    }
		                }
                
				$this.css('maxHeight', 'none'); // Remove old max-height so that we can resize up as well as down
				tall = $this.height(); // Grab the height
				newHeight = Math.floor(tall / base) * base; // Make up a new height based on the baseline
				$this.css('maxHeight', newHeight); // Set it!
			}

			setbase(breakpoints); // Call on load

			$(window).resize(function(){ // And call again on resize.
				setbase(breakpoints);
			});

		});

	}

}) ( jQuery );
