
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

/* Lettering.JS 0.6.1 by Dave Rupert  - http://daverupert.com */
(function($){function injector(t,splitter,klass,after){var a=t.text().split(splitter),inject='';if(a.length){$(a).each(function(i,item){inject+='<span class="'+klass+(i+1)+'">'+item+'</span>'+after});t.empty().append(inject)}}var methods={init:function(){return this.each(function(){injector($(this),'','char','')})},words:function(){return this.each(function(){injector($(this),' ','word',' ')})},lines:function(){return this.each(function(){var r="eefec303079ad17405c889e092e105b0";injector($(this).children("br").replaceWith(r).end(),r,'line','')})}};$.fn.lettering=function(method){if(method&&methods[method]){return methods[method].apply(this,[].slice.call(arguments,1))}else if(method==='letters'||!method){return methods.init.apply(this,[].slice.call(arguments,0))}$.error('Method '+method+' does not exist on jQuery.lettering');return this}})(jQuery);

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
(function(e){e.fn.baseline=function(t){var n,r,i,s=0;return this.each(function(){var o=e(this),u=function(e){if(typeof e=="number")i=e;else if(typeof e=="object")for(key in e){var t=parseInt(key);document.width>t&&t>=s&&(i=e[key],s=t)}o.css("maxHeight","none"),n=o.height(),r=Math.floor(n/i)*i,o.css("maxHeight",r)};u(t),e(window).resize(function(){u(t)})})}})(jQuery);

/*
 * jQuery hashchange event - v1.3 - 7/21/2010
 * http://benalman.com/projects/jquery-hashchange-plugin/
 * 
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
(function($,e,b){var c="hashchange",h=document,f,g=$.event.special,i=h.documentMode,d="on"+c in e&&(i===b||i>7);function a(j){j=j||location.href;return"#"+j.replace(/^[^#]*#?(.*)$/,"$1")}$.fn[c]=function(j){return j?this.bind(c,j):this.trigger(c)};$.fn[c].delay=50;g[c]=$.extend(g[c],{setup:function(){if(d){return false}$(f.start)},teardown:function(){if(d){return false}$(f.stop)}});f=(function(){var j={},p,m=a(),k=function(q){return q},l=k,o=k;j.start=function(){p||n()};j.stop=function(){p&&clearTimeout(p);p=b};function n(){var r=a(),q=o(m);if(r!==m){l(m=r,q);$(e).trigger(c)}else{if(q!==m){location.href=location.href.replace(/#.*/,"")+q}}p=setTimeout(n,$.fn[c].delay)}$.browser.msie&&!d&&(function(){var q,r;j.start=function(){if(!q){r=$.fn[c].src;r=r&&r+a();q=$('<iframe tabindex="-1" title="empty"/>').hide().one("load",function(){r||l(a());n()}).attr("src",r||"javascript:0").insertAfter("body")[0].contentWindow;h.onpropertychange=function(){try{if(event.propertyName==="title"){q.document.title=h.title}}catch(s){}}}};j.stop=k;o=function(){return a(q.location.href)};l=function(v,s){var u=q.document,t=$.fn[c].domain;if(v!==s){u.title=h.title;u.open();t&&u.write('<script>document.domain="'+t+'"<\/script>');u.close();q.location.hash=v}}})();return j})()})(jQuery,this);
