
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
* */
(function(c){var b="background-position",d=c.camelCase;function a(g){var f="100%",i="0px",e={top:i,bottom:f,left:i,right:f};return e[g]||g}c.each(["x","y"],function(f,e){var g=d(b+"-"+e);c.cssHooks[g]={get:function(h){var i=c.css(h,b).split(/\s+/,2);return a(i[f])},set:function(h,i){var j=c.css(h,b).split(/\s+/,2);j[f]=a(i);c.style(h,b,j.join(" "))}};c.fx.step[g]=function(h){c.style(h.elem,h.prop,h.now)}})}(jQuery));
