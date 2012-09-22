
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

/*
 * Accessifyhtml5.js
 *
 * Source: https://github.com/yatil/accessifyhtml5.js
 */

var AccessifyHTML5=function(b){var a={article:{role:"article"},aside:{role:"complementary"},nav:{role:"navigation"},output:{"aria-live":"polite"},section:{role:"region"},"[required]":{"aria-required":"true"}};if(b){if(b.header){a[b.header]={role:"banner"}}if(b.footer){a[b.footer]={role:"contentinfo"}}if(b.main){a[b.main]={role:"main"}}}$.each(a,function(c,d){$(c).attr(d)})};

/*  --------------------------------------------------

    Emphasis
    by Michael Donohoe (@donohoe)
    https://github.com/NYTimes/Emphasis
    http://open.blogs.nytimes.com/2011/01/10/emphasis-update-and-source/
    -------------------------------------------------- */
(function(e){var t={init:function(t){this.config(),this.paraSelectors=t.find("p"),this.pl=!1,this.p=!1,this.h=!1,this.s=!1,this.vu=!1,this.kh="|",this.addCSS(),this.readHash(),e(document).bind("keydown",this.keydown)},config:function(){this.classReady="emReady",this.classActive="emActive",this.classHighlight="emHighlight",this.classInfo="emInfo",this.classAnchor="emAnchor",this.classActiveAnchor="emActiveAnchor"},addCSS:function(){var e=document.createElement("style");e.setAttribute("type","text/css");var t="p."+this.classActive+" span { background-color:#f2f4f5; } p span."+this.classHighlight+" { background-color:#fff0b3; } span."+this.classInfo+" { position:absolute; margin:-1px 0px 0px -8px; padding:0; font-size:10px; background-color: transparent !important} span."+this.classInfo+" a { text-decoration: none; } a."+this.classActiveAnchor+" { color: #000; font-size: 11px; }";try{e.innerHTML=t}catch(n){e.styleSheet.cssText=t}document.getElementsByTagName("head")[0].appendChild(e)},readHash:function(){var e=decodeURI(location.hash),t=!1,n=[],r={},i,s,o,u,a,f,l,c,h,p,d,v,m;if(e.indexOf("[")<0&&e.indexOf("]")<0){s=/[ph][0-9]+|s[0-9,]+|[0-9]/g;if(e)while((i=s.exec(e))!==null){o=i[0].substring(0,1),u=i[0].substring(1);if(o==="p")t=parseInt(u,10);else if(o==="h")n.push(parseInt(u,10));else{i=u.split(",");for(a=0;a<i.length;a++)i[a]=parseInt(i[a],10);r[n[n.length-1]]=i}}}else{f=e.match(/p\[([^[\]]*)\]/),l=e.match(/h\[([^[\]]*)\]/),t=f&&f.length>0?f[1]:!1,h=l&&l.length>0?l[1]:!1;if(h){h=h.match(/[a-zA-Z]+(,[0-9]+)*/g);for(a=0;a<h.length;a++){i=h[a].split(","),p=i[0],d=this.findKey(p).index;if(d!==c){n.push(parseInt(d,10)+1),v=i,v.shift();if(v.length>0)for(m=1;m<v.length;m++)v[m]=parseInt(v[m],10);r[n[n.length-1]]=v}}}}this.p=t,this.h=n,this.s=r,this.goAnchor(t),this.goHighlight(n,r)},keydown:function(e){var n=t,r=e.keyCode;n.kh=n.kh+r+"|",n.kh.indexOf("|16|16|")>-1&&(n.vu=n.vu?!1:!0,n.paragraphInfo(n.vu)),setTimeout(function(){n.kh="|"},500)},paragraphList:function(){if(this.pl&&this.pl.list.length>0)return this.pl;var t=this,n=[],r=[],i=0,s=this.paraSelectors.length,o,u,a;for(o=0;o<s;o++)u=this.paraSelectors[o],(u.innerText||u.textContent||"").length>0&&(a=t.createKey(u),n.push(u),r.push(a),u.setAttribute("data-key",a),u.setAttribute("data-num",i),e(u).bind("click",function(e){t.paragraphClick(e)}),i++);return this.pl={list:n,keys:r},this.pl},paragraphClick:function(t){if(!this.vu)return;var n=!1,r=t.currentTarget.nodeName==="P"?t.currentTarget:!1,i=e(r),s=t.target.nodeName==="SPAN"?t.target:!1,o=t.target.nodeName==="A"?t.target:!1,u,a,f,l,c;o&&(e(o).hasClass(this.classActiveAnchor)||(this.updateAnchor(o),n=!0,t.preventDefault()));if(!r&&!s){this.removeClass(this.classActive);return}if(i.hasClass(this.classReady))!i.hasClass(this.classActive)&&s&&!e(s).hasClass(this.classHighlight)?(e(this).removeClass(this.classActive),i.addClass(this.classActive)):(i.hasClass(this.classActive)||(e(this).removeClass(this.classActive),i.addClass(this.classActive)),s&&(e(s).toggleClass(this.classHighlight),n=!0));else{u=this.getSentences(r),a=u.length;for(f=0;f<a;f++)u[f]="<span data-num='"+(f+1)+"'>"+this.rtrim(u[f])+"</span>";l=u.join(". ").replace(/__DOT__/g,".").replace(/<\/span>\./g,".</span>"),c=l.substring(l.length-8).charCodeAt(0),"|8221|63|46|41|39|37|34|33|".indexOf(c)===-1&&(l+="."),r.innerHTML=l,r.setAttribute("data-sentences",a),e(this).removeClass(this.classActive),i.addClass(this.classActive),i.addClass(this.classReady),n=!0}n&&this.updateURLHash()},paragraphInfo:function(t){var n,r,i,s,o,u,a,f;if(t){n=e("span."+this.classInfo);if(n.length===0){r=this.paragraphList(),i=r.list.length;for(s=0;s<i;s++)o=r.list[s]||!1,o&&(u=r.keys[s],a=u===this.p?" "+this.classActiveAnchor:"",o.innerHTML="<span class='"+this.classInfo+"'><a class='"+this.classAnchor+a+"' href='#p["+u+"]' data-key='"+u+"' title='Link to "+this.ordinal(s+1)+" paragraph'>&para;</a></span>"+o.innerHTML)}}else{f=e("span."+this.classInfo),i=f.length;for(s=0;s<i;s++)e(f[s]).remove();e(this).removeClass(this.classActive)}},updateAnchor:function(t){this.p=t.getAttribute("data-key"),e(this).removeClass(this.classActiveAnchor),e(t).addClass(this.classActiveAnchor)},updateURLHash:function(){var t="h[",n=e("p.emReady"),r=n.length,i,s,o,u,a,f,l,c;for(i=0;i<r;i++){s=n[i].getAttribute("data-key");if(e(n[i]).hasClass(this.classHighlight))t+=","+s;else{o=e("span."+this.classHighlight,n[i]),u=o.length,a=n[i].getAttribute("data-sentences"),u>0&&(t+=","+s);if(a!==u)for(c=0;c<u;c++)t+=","+o[c].getAttribute("data-num")}}f=this.p?"p["+this.p+"],":"",l=(f+(t.replace("h[,","h[")+"]")).replace(",h[]",""),location.hash=l},createKey:function(e){var t="",n=6,r=(e.innerText||e.textContent||"").replace(/[^a-z\. ]+/gi,""),i,s,o,u,a,f;if(r&&r.length>1){i=this.getSentences(r);if(i.length>0){s=this.cleanArray(i[0].replace(/[\s\s]+/gi," ").split(" ")).slice(0,n/2),o=this.cleanArray(i[i.length-1].replace(/[\s\s]+/gi," ").split(" ")).slice(0,n/2),u=s.concat(o),a=u.length>n?n:u.length;for(f=0;f<a;f++)t+=u[f].substring(0,1)}}return t},findKey:function(e){var t=this.paragraphList(),n=t.keys.length,r=!1,i=!1,s,o,u;for(s=0;s<n;s++){if(e===t.keys[s])return{index:s,elm:t.list[s]};r||(o=this.lev(e.slice(0,3),t.keys[s].slice(0,3)),u=this.lev(e.slice(-3),t.keys[s].slice(-3)),o+u<3&&(r=s,i=t.list[s]))}return{index:r,elm:i}},goAnchor:function(t){if(!t)return;var n=isNaN(t)?this.findKey(t).elm:this.paragraphList().list[t-1]||!1;n&&setTimeout(function(){e(window).scrollTop(e(n).offset().top)},500)},goHighlight:function(t,n){if(!t)return;var r=t.length,i,s,o,u,a,f,l,c,h;for(i=0;i<r;i++){s=this.paragraphList().list[t[i]-1]||!1;if(s){o=n[t[i].toString()]||!1,u=!o||o.length===0,a=this.getSentences(s),f=a.length;for(l=0;l<f;l++)c=u?l:o[l]-1,a[l]="<span data-num='"+(l+1)+"'>"+a[l]+"</span>";for(l=0;l<f;l++)c=u?l:o[l]-1,h=a[c]||!1,h&&(a[c]=a[c].replace("<span","<span class='"+this.classHighlight+"'"));s.setAttribute("data-sentences",f),s.innerHTML=a.join(". ").replace(/__DOT__/g,".").replace(/<\/span>\./g,".</span>"),e(s).addClass("emReady")}}},getSentences:function(e){var t=typeof e=="string"?e:e.innerHTML,n="Mr,Ms,Mrs,Miss,Msr,Dr,Gov,Pres,Sen,Prof,Gen,Rep,St,Messrs,Col,Sr,Jf,Ph,Sgt,Mgr,Fr,Rev,No,Jr,Snr",r="A,B,C,D,E,F,G,H,I,J,K,L,M,m,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,etc,oz,cf,viz,sc,ca,Ave,St",i="Calif,Mass,Penn,AK,AL,AR,AS,AZ,CA,CO,CT,DC,DE,FL,FM,GA,GU,HI,IA,ID,IL,IN,KS,KY,LA,MA,MD,ME,MH,MI,MN,MO,MP,MS,MT,NC,ND,NE,NH,NJ,NM,NV,NY,OH,OK,OR,PA,PR,PW,RI,SC,SD,TN,TX,UT,VA,VI,VT,WA,WI,WV,WY,AE,AA,AP,NYC,GB,IRL,IE,UK,GB,FR",s="0,1,2,3,4,5,6,7,8,9",o="aero,asia,biz,cat,com,coop,edu,gov,info,int,jobs,mil,mobi,museum,name,net,org,pro,tel,travel,xxx",u="www",a="__DOT__",f=(r+","+i+","+s+","+u).split(","),l=f.length,c,h;for(c=0;c<l;c++)t=t.replace(new RegExp(" "+f[c]+"\\.","g")," "+f[c]+a);f=(n+","+s).split(","),l=f.length;for(c=0;c<l;c++)t=t.replace(new RegExp(f[c]+"\\.","g"),f[c]+a);f=o.split(","),l=f.length;for(c=0;c<l;c++)t=t.replace(new RegExp("\\."+f[c],"g"),a+f[c]);return h=this.cleanArray(t.split(". ")),h},ordinal:function(e){var t=["th","st","nd","rd"],n=e%100;return e+(t[(n-20)%10]||t[n]||t[0])},lev:function(e,t){var n=e.length,r=t.length,i=[],s,o,u,a;i[0]=[],n<r&&(s=e,e=t,t=s,o=n,n=r,r=o);for(s=0;s<r+1;s++)i[0][s]=s;for(u=1;u<n+1;u++){i[u]=[],i[u][0]=u;for(a=1;a<r+1;a++)i[u][a]=this.smallest(i[u-1][a]+1,i[u][a-1]+1,i[u-1][a-1]+(e.charAt(u-1)===t.charAt(a-1)?0:1))}return i[n][r]},smallest:function(e,t,n){return e<t&&e<n?e:t<e&&t<n?t:n},rtrim:function(e){return e.replace(/\s+$/,"")},cleanArray:function(e){var t=[],n;for(n=0;n<e.length;n++)e[n]&&e[n].replace(/ /g,"").length>0&&t.push(e[n]);return t}};e.emphasis=e.fn.emphasis=function(){t.init(this)}})(jQuery);
