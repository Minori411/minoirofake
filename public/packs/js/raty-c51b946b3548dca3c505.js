/*! For license information please see raty-c51b946b3548dca3c505.js.LICENSE.txt */
!function(t){var e={};function i(s){if(e[s])return e[s].exports;var o=e[s]={i:s,l:!1,exports:{}};return t[s].call(o.exports,o,o.exports,i),o.l=!0,o.exports}i.m=t,i.c=e,i.d=function(t,e,s){i.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:s})},i.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},i.t=function(t,e){if(1&e&&(t=i(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var s=Object.create(null);if(i.r(s),Object.defineProperty(s,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var o in t)i.d(s,o,function(e){return t[e]}.bind(null,o));return s},i.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return i.d(e,"a",e),e},i.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},i.p="/packs/",i(i.s=18)}({18:function(t,e){var i;$.raty={cancelButton:!1,cancelClass:"raty-cancel",cancelHint:"Cancel this rating!",cancelOff:"cancel-off.png",cancelOn:"cancel-on.png",cancelPlace:"left",click:void 0,half:!1,halfShow:!0,hints:["bad","poor","regular","good","gorgeous"],iconRange:void 0,iconRangeSame:!1,mouseout:void 0,mouseover:void 0,noRatedMsg:"Not rated yet!",number:5,numberMax:20,path:void 0,precision:!1,readOnly:!1,round:{down:.25,full:.6,up:.76},score:void 0,scoreName:"score",single:!1,space:!0,starHalf:"star-half.png",starOff:"star-off.png",starOn:"star-on.png",starType:"img",target:void 0,targetFormat:"{score}",targetKeep:!1,targetScore:void 0,targetText:"",targetType:"hint"},$.fn.raty=function(t){return this.each((function(){return new $.raty.Raty(this,t)._create()}))},$.raty.Raty=((i=function(t,e){this.element=t,this.self=$(t),this.opt=$.extend(!0,{},$.raty,e,this.self.data())}).prototype={_create:function(){this._executeCallbacks(),this._adjustNumber(),this._adjustHints(),this.opt.score=this._adjustedScore(this.opt.score),"img"!==this.opt.starType&&this._adjustStarName(),this._setPath(),this._createStars(),this.opt.cancelButton&&this._createCancel(),this.opt.precision&&this._adjustPrecision(),this._createScore(),this._apply(this.opt.score),this._setTitle(this.opt.score),this._target(this.opt.score),this.opt.readOnly?this._lock():(this.element.style.cursor="pointer",this._binds()),this.self.data("raty",this)},_adjustedScore:function(t){if(t||0===t)return this._between(t,0,this.opt.number)},_adjustHints:function(){if(this.opt.hints||(this.opt.hints=[]),this.opt.halfShow||this.opt.half)for(var t=this.opt.precision?10:2,e=0;e<this.opt.number;e++){var i=this.opt.hints[e];"[object Array]"!==Object.prototype.toString.call(i)&&(i=[i]),this.opt.hints[e]=[];for(var s=0;s<t;s++){var o=i[s],n=i[i.length-1];void 0===n&&(n=null),this.opt.hints[e][s]=void 0===o?n:o}}},_adjustNumber:function(){this.opt.number=this._between(this.opt.number,1,this.opt.numberMax)},_adjustPrecision:function(){this.opt.half=!0},_adjustStarName:function(){var t=["cancelOff","cancelOn","starHalf","starOff","starOn"];this.opt.path="";for(var e=0;e<t.length;e++)this.opt[t[e]]=this.opt[t[e]].replace(".","-")},_apply:function(t){this._fill(t),t&&(t>0&&this.scoreField.val(t),this._roundStars(t))},_attributesForIndex:function(t){var e=this._nameForIndex(t),i={alt:t,src:this.opt.path+this.opt[e]};return"img"!==this.opt.starType&&(i={"data-alt":t,class:this.opt[e]}),i.title=this._getHint(t),i},_between:function(t,e,i){return Math.min(Math.max(parseFloat(t),e),i)},_binds:function(){this.cancelButton&&(this._bindOverCancel(),this._bindClickCancel(),this._bindOutCancel()),this._bindOver(),this._bindClick(),this._bindOut()},_bindClick:function(){var t=this;this.stars.on("click.raty",(function(e){if(!t.self.data("readonly")){var i=!0,s=t.opt.half||t.opt.precision?t.self.data("score"):this.alt||$(this).data("alt");t.opt.half&&!t.opt.precision&&(s=t._roundHalfScore(s)),t.opt.click&&(i=t.opt.click.call(t.element,+s,e)),(i||void 0===i)&&t._apply(+s)}}))},_bindClickCancel:function(){this.cancelButton.on("click.raty",function(t){this.scoreField.removeAttr("value"),this.opt.click&&this.opt.click.call(this.element,null,t)}.bind(this))},_bindOut:function(){this.self.on("mouseleave.raty",function(t){var e=+this.scoreField.val()||void 0;this._apply(e),this._target(e,t),this._resetTitle(),this.opt.mouseout&&this.opt.mouseout.call(this.element,e,t)}.bind(this))},_bindOutCancel:function(){var t=this;this.cancelButton.on("mouseleave.raty",(function(e){var i=t.opt.cancelOff;if("img"!==t.opt.starType&&(i=t.opt.cancelClass+" "+i),t._setIcon(this,i),t.opt.mouseout){var s=+t.scoreField.val()||void 0;t.opt.mouseout.call(t.element,s,e)}}))},_bindOver:function(){var t=this,e=t.opt.half?"mousemove.raty":"mouseover.raty";this.stars.on(e,(function(e){var i=t._getScoreByPosition(e,this);t._fill(i),t.opt.half&&(t._roundStars(i,e),t._setTitle(i,e),t.self.data("score",i)),t._target(i,e),t.opt.mouseover&&t.opt.mouseover.call(t.element,i,e)}))},_bindOverCancel:function(){var t=this;this.cancelButton.on("mouseover.raty",(function(e){if(!t.self.data("readonly")){var i=t.opt.path+t.opt.starOff,s=t.opt.cancelOn;"img"===t.opt.starType?t.stars.attr("src",i):(s=t.opt.cancelClass+" "+s,t.stars.attr("class",i)),t._setIcon(this,s),t._target(null,e),t.opt.mouseover&&t.opt.mouseover.call(t.element,null)}}))},_buildScoreField:function(){return $("<input />",{name:this.opt.scoreName,type:"hidden"}).appendTo(this.self)},_createCancel:function(){var t=this.opt.path+this.opt.cancelOff,e=$("<"+this.opt.starType+" />",{title:this.opt.cancelHint,class:this.opt.cancelClass});"img"===this.opt.starType?e.attr({src:t,alt:"x"}):e.attr("data-alt","x").addClass(t),"left"===this.opt.cancelPlace?this.self.prepend("&#160;").prepend(e):this.self.append("&#160;").append(e),this.cancelButton=e},_createScore:function(){var t=$(this.opt.targetScore);this.scoreField=t.length?t:this._buildScoreField()},_createStars:function(){for(var t=1;t<=this.opt.number;t++){var e=this._attributesForIndex(t);$("<"+this.opt.starType+" />",e).appendTo(this.element),this.opt.space&&t<this.opt.number&&this.self.append("&#160;")}this.stars=this.self.children(this.opt.starType)},_error:function(t){$(this).text(t),$.error(t)},_executeCallbacks:function(){for(var t=["number","readOnly","score","scoreName","target","path"],e=0;e<t.length;e++)if("function"===typeof this.opt[t[e]]){var i=this.opt[t[e]].call(this.element);i?this.opt[t[e]]=i:delete this.opt[t[e]]}},_fill:function(t){var e=0;if(this.opt.iconRangeSame&&this.opt.iconRange)for(;e<this.opt.iconRange.length&&this.opt.iconRange[e].range<t;)e++;for(var i=1;i<=this.stars.length;i++){var s,o=this.stars[i-1],n=this._turnOn(i,t);if(this.opt.iconRange&&this.opt.iconRange.length>e){var a=this.opt.iconRange[e];s=this._getRangeIcon(a,n),i<=a.range&&this._setIcon(o,s),i===a.range&&e++}else s=this.opt[n?"starOn":"starOff"],this._setIcon(o,s)}},_getDecimal:function(t,e){var i=t.toString().split(".")[1],s=0;return i&&(s=parseInt(i.slice(0,e),10),"9999"===i.slice(1,5)&&s++),s},_getRangeIcon:function(t,e){return e?t.on||this.opt.starOn:t.off||this.opt.starOff},_getScoreByPosition:function(t,e){var i=parseInt(e.alt||e.getAttribute("data-alt"),10);if(this.opt.half){var s=this._getWidth();i=i-1+parseFloat((t.pageX-$(e).offset().left)/s)}return i},_getHint:function(t,e){if(0!==t&&!t)return this.opt.noRatedMsg;var i=this._getDecimal(t,1),s=Math.ceil(t),o=this.opt.hints[(s||1)-1],n=o,a=!e||this.isMove;return this.opt.precision?(a&&(i=0===i?9:i-1),n=o[i]):(this.opt.halfShow||this.opt.half)&&(n=o[i=a&&0===i||i>5?1:0]),""===n?"":n||t},_getWidth:function(){var t=this.stars[0].width||parseFloat(this.stars.eq(0).css("font-size"));return t||this._error("Could not get the icon width!"),t},_lock:function(){var t=this._getHint(this.scoreField.val());this.element.style.cursor="",this.element.title=t,this.scoreField.prop("readonly",!0),this.stars.prop("title",t),this.cancelButton&&this.cancelButton.hide(),this.self.data("readonly",!0)},_nameForIndex:function(t){return this.opt.score&&this.opt.score>=t?"starOn":"starOff"},_resetTitle:function(){for(var t=0;t<this.opt.number;t++)this.stars[t].title=this._getHint(t+1)},_roundHalfScore:function(t){var e=parseInt(t,10),i=this._getDecimal(t,1);return 0!==i&&(i=i>5?1:.5),e+i},_roundStars:function(t,e){var i=this._starName(t,e);if(i){var s=this.opt[i],o=this.stars[Math.ceil(t)-1];this._setIcon(o,s)}},_setIcon:function(t,e){t["img"===this.opt.starType?"src":"className"]=this.opt.path+e},_setPath:function(){this.opt.path=this.opt.path||"",this.opt.path&&"/"!==this.opt.path.slice(-1)[0]&&(this.opt.path+="/")},_setTarget:function(t,e){e&&(e=this.opt.targetFormat.toString().replace("{score}",e)),t.is(":input")?t.val(e):t.html(e)},_setTitle:function(t,e){if(t){var i=parseInt(Math.ceil(t),10);this.stars[i-1].title=this._getHint(t,e)}},_starName:function(t,e){var i=+(t%1).toFixed(2);return e||this.isMove?i>.5?"starOn":"starHalf":i<=this.opt.round.down?void 0:this.opt.halfShow&&i<this.opt.round.up?"starHalf":i<this.opt.round.full?"starOff":"starOn"},_target:function(t,e){if(this.opt.target){var i=$(this.opt.target);i.length||this._error("Target selector invalid or missing!");var s=e&&"mouseover"===e.type;if(void 0===t)t=this.opt.targetText;else if(null===t)t=s?this.opt.cancelHint:this.opt.targetText;else{"hint"===this.opt.targetType?t=this._getHint(t,e):this.opt.precision&&(t=parseFloat(t).toFixed(1));var o=e&&"mousemove"===e.type;s||o||this.opt.targetKeep||(t=this.opt.targetText)}this._setTarget(i,t)}},_turnOn:function(t,e){return this.opt.single?t===e:t<=e},_unlock:function(){this.element.style.cursor="pointer",this.element.removeAttribute("title"),this.scoreField.removeAttr("readonly"),this.self.data("readonly",!1),this._resetTitle(),this.cancelButton&&this.cancelButton.css("display","")},cancel:function(t){!0!==this.self.data("readonly")&&(this[t?"click":"score"].call(this,null),this.scoreField.removeAttr("value"))},click:function(t){!0!==this.self.data("readonly")&&(t=this._adjustedScore(t),this._apply(t),this.opt.click&&this.opt.click.call(this.element,t,$.Event("click")),this._target(t))},getScore:function(){var t,e=[];return t=this.scoreField.val(),e.push(t?+t:void 0),e.length>1?e:e[0]},move:function(t){var e=parseInt(t,10),i=this._getDecimal(t,1);e>=this.opt.number&&(e=this.opt.number-1,i=10);var s=this._getWidth()/10,o=$(this.stars[e]),n=o.offset().left+s*i,a=$.Event("mousemove",{pageX:n});this.isMove=!0,o.trigger(a),this.isMove=!1},readOnly:function(t){this.self.data("readonly")!==t&&(t?(this.self.off(".raty").children(this.opt.starType).off(".raty"),this._lock()):(this._binds(),this._unlock()),this.self.data("readonly",t))},score:function(){return arguments.length?this.setScore.apply(this,arguments):this.getScore()},setScore:function(t){!0!==this.self.data("readonly")&&(t=this._adjustedScore(t),this._apply(t),this._target(t))}},i)}});
//# sourceMappingURL=raty-c51b946b3548dca3c505.js.map