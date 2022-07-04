(window.webpackJsonp=window.webpackJsonp||[]).push([[5],{68:function(t,n,e){"use strict";e.r(n),e.d(n,"Connection",(function(){return g})),e.d(n,"ConnectionMonitor",(function(){return a})),e.d(n,"Consumer",(function(){return O})),e.d(n,"INTERNAL",(function(){return l})),e.d(n,"Subscription",(function(){return S})),e.d(n,"Subscriptions",(function(){return P})),e.d(n,"SubscriptionGuarantor",(function(){return A})),e.d(n,"adapters",(function(){return i})),e.d(n,"createWebSocketURL",(function(){return _})),e.d(n,"logger",(function(){return o})),e.d(n,"createConsumer",(function(){return j})),e.d(n,"getConfig",(function(){return E}));var i={logger:self.console,WebSocket:self.WebSocket},o={log:function(){if(this.enabled){for(var t,n=arguments.length,e=new Array(n),o=0;o<n;o++)e[o]=arguments[o];e.push(Date.now()),(t=i.logger).log.apply(t,["[ActionCable]"].concat(e))}}};function r(t,n){for(var e=0;e<n.length;e++){var i=n[e];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(t,i.key,i)}}var s=function(){return(new Date).getTime()},c=function(t){return(s()-t)/1e3},u=function(){function t(n){!function(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}(this,t),this.visibilityDidChange=this.visibilityDidChange.bind(this),this.connection=n,this.reconnectAttempts=0}var n,e,i;return n=t,(e=[{key:"start",value:function(){this.isRunning()||(this.startedAt=s(),delete this.stoppedAt,this.startPolling(),addEventListener("visibilitychange",this.visibilityDidChange),o.log("ConnectionMonitor started. stale threshold = ".concat(this.constructor.staleThreshold," s")))}},{key:"stop",value:function(){this.isRunning()&&(this.stoppedAt=s(),this.stopPolling(),removeEventListener("visibilitychange",this.visibilityDidChange),o.log("ConnectionMonitor stopped"))}},{key:"isRunning",value:function(){return this.startedAt&&!this.stoppedAt}},{key:"recordPing",value:function(){this.pingedAt=s()}},{key:"recordConnect",value:function(){this.reconnectAttempts=0,this.recordPing(),delete this.disconnectedAt,o.log("ConnectionMonitor recorded connect")}},{key:"recordDisconnect",value:function(){this.disconnectedAt=s(),o.log("ConnectionMonitor recorded disconnect")}},{key:"startPolling",value:function(){this.stopPolling(),this.poll()}},{key:"stopPolling",value:function(){clearTimeout(this.pollTimeout)}},{key:"poll",value:function(){var t=this;this.pollTimeout=setTimeout((function(){t.reconnectIfStale(),t.poll()}),this.getPollInterval())}},{key:"getPollInterval",value:function(){var t=this.constructor,n=t.staleThreshold,e=t.reconnectionBackoffRate;return 1e3*n*Math.pow(1+e,Math.min(this.reconnectAttempts,10))*(1+(0===this.reconnectAttempts?1:e)*Math.random())}},{key:"reconnectIfStale",value:function(){this.connectionIsStale()&&(o.log("ConnectionMonitor detected stale connection. reconnectAttempts = ".concat(this.reconnectAttempts,", time stale = ").concat(c(this.refreshedAt)," s, stale threshold = ").concat(this.constructor.staleThreshold," s")),this.reconnectAttempts++,this.disconnectedRecently()?o.log("ConnectionMonitor skipping reopening recent disconnect. time disconnected = ".concat(c(this.disconnectedAt)," s")):(o.log("ConnectionMonitor reopening"),this.connection.reopen()))}},{key:"refreshedAt",get:function(){return this.pingedAt?this.pingedAt:this.startedAt}},{key:"connectionIsStale",value:function(){return c(this.refreshedAt)>this.constructor.staleThreshold}},{key:"disconnectedRecently",value:function(){return this.disconnectedAt&&c(this.disconnectedAt)<this.constructor.staleThreshold}},{key:"visibilityDidChange",value:function(){var t=this;"visible"===document.visibilityState&&setTimeout((function(){!t.connectionIsStale()&&t.connection.isOpen()||(o.log("ConnectionMonitor reopening stale connection on visibilitychange. visibilityState = ".concat(document.visibilityState)),t.connection.reopen())}),200)}}])&&r(n.prototype,e),i&&r(n,i),t}();u.staleThreshold=6,u.reconnectionBackoffRate=.15;var a=u,l={message_types:{welcome:"welcome",disconnect:"disconnect",ping:"ping",confirmation:"confirm_subscription",rejection:"reject_subscription"},disconnect_reasons:{unauthorized:"unauthorized",invalid_request:"invalid_request",server_restart:"server_restart"},default_mount_path:"/cable",protocols:["actioncable-v1-json","actioncable-unsupported"]};function f(t,n){for(var e=0;e<n.length;e++){var i=n[e];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(t,i.key,i)}}var h=l.message_types,p=l.protocols,d=p.slice(0,p.length-1),v=[].indexOf,b=function(){function t(n){!function(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}(this,t),this.open=this.open.bind(this),this.consumer=n,this.subscriptions=this.consumer.subscriptions,this.monitor=new a(this),this.disconnected=!0}var n,e,r;return n=t,e=[{key:"send",value:function(t){return!!this.isOpen()&&(this.webSocket.send(JSON.stringify(t)),!0)}},{key:"open",value:function(){return this.isActive()?(o.log("Attempted to open WebSocket, but existing socket is ".concat(this.getState())),!1):(o.log("Opening WebSocket, current state is ".concat(this.getState(),", subprotocols: ").concat(p)),this.webSocket&&this.uninstallEventHandlers(),this.webSocket=new i.WebSocket(this.consumer.url,p),this.installEventHandlers(),this.monitor.start(),!0)}},{key:"close",value:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{allowReconnect:!0},n=t.allowReconnect;if(n||this.monitor.stop(),this.isActive())return this.webSocket.close()}},{key:"reopen",value:function(){if(o.log("Reopening WebSocket, current state is ".concat(this.getState())),!this.isActive())return this.open();try{return this.close()}catch(t){o.log("Failed to reopen WebSocket",t)}finally{o.log("Reopening WebSocket in ".concat(this.constructor.reopenDelay,"ms")),setTimeout(this.open,this.constructor.reopenDelay)}}},{key:"getProtocol",value:function(){if(this.webSocket)return this.webSocket.protocol}},{key:"isOpen",value:function(){return this.isState("open")}},{key:"isActive",value:function(){return this.isState("open","connecting")}},{key:"isProtocolSupported",value:function(){return v.call(d,this.getProtocol())>=0}},{key:"isState",value:function(){for(var t=arguments.length,n=new Array(t),e=0;e<t;e++)n[e]=arguments[e];return v.call(n,this.getState())>=0}},{key:"getState",value:function(){if(this.webSocket)for(var t in i.WebSocket)if(i.WebSocket[t]===this.webSocket.readyState)return t.toLowerCase();return null}},{key:"installEventHandlers",value:function(){for(var t in this.events){var n=this.events[t].bind(this);this.webSocket["on".concat(t)]=n}}},{key:"uninstallEventHandlers",value:function(){for(var t in this.events)this.webSocket["on".concat(t)]=function(){}}}],e&&f(n.prototype,e),r&&f(n,r),t}();b.reopenDelay=500,b.prototype.events={message:function(t){if(this.isProtocolSupported()){var n=JSON.parse(t.data),e=n.identifier,i=n.message,r=n.reason,s=n.reconnect;switch(n.type){case h.welcome:return this.monitor.recordConnect(),this.subscriptions.reload();case h.disconnect:return o.log("Disconnecting. Reason: ".concat(r)),this.close({allowReconnect:s});case h.ping:return this.monitor.recordPing();case h.confirmation:return this.subscriptions.confirmSubscription(e),this.subscriptions.notify(e,"connected");case h.rejection:return this.subscriptions.reject(e);default:return this.subscriptions.notify(e,"received",i)}}},open:function(){if(o.log("WebSocket onopen event, using '".concat(this.getProtocol(),"' subprotocol")),this.disconnected=!1,!this.isProtocolSupported())return o.log("Protocol is unsupported. Stopping monitor and disconnecting."),this.close({allowReconnect:!1})},close:function(t){if(o.log("WebSocket onclose event"),!this.disconnected)return this.disconnected=!0,this.monitor.recordDisconnect(),this.subscriptions.notifyAll("disconnected",{willAttemptReconnect:this.monitor.isRunning()})},error:function(){o.log("WebSocket onerror event")}};var g=b;function y(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}function m(t,n){for(var e=0;e<n.length;e++){var i=n[e];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(t,i.key,i)}}var k=function(t,n){if(null!=n)for(var e in n){var i=n[e];t[e]=i}return t},S=function(){function t(n){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{},i=arguments.length>2?arguments[2]:void 0;y(this,t),this.consumer=n,this.identifier=JSON.stringify(e),k(this,i)}var n,e,i;return n=t,e=[{key:"perform",value:function(t){var n=arguments.length>1&&void 0!==arguments[1]?arguments[1]:{};return n.action=t,this.send(n)}},{key:"send",value:function(t){return this.consumer.send({command:"message",identifier:this.identifier,data:JSON.stringify(t)})}},{key:"unsubscribe",value:function(){return this.consumer.subscriptions.remove(this)}}],e&&m(n.prototype,e),i&&m(n,i),t}();function w(t,n){for(var e=0;e<n.length;e++){var i=n[e];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(t,i.key,i)}}var A=function(){function t(n){!function(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}(this,t),this.subscriptions=n,this.pendingSubscriptions=[]}var n,e,i;return n=t,(e=[{key:"guarantee",value:function(t){-1==this.pendingSubscriptions.indexOf(t)?(o.log("SubscriptionGuarantor guaranteeing ".concat(t.identifier)),this.pendingSubscriptions.push(t)):o.log("SubscriptionGuarantor already guaranteeing ".concat(t.identifier)),this.startGuaranteeing()}},{key:"forget",value:function(t){o.log("SubscriptionGuarantor forgetting ".concat(t.identifier)),this.pendingSubscriptions=this.pendingSubscriptions.filter((function(n){return n!==t}))}},{key:"startGuaranteeing",value:function(){this.stopGuaranteeing(),this.retrySubscribing()}},{key:"stopGuaranteeing",value:function(){clearTimeout(this.retryTimeout)}},{key:"retrySubscribing",value:function(){var t=this;this.retryTimeout=setTimeout((function(){t.subscriptions&&"function"===typeof t.subscriptions.subscribe&&t.pendingSubscriptions.map((function(n){o.log("SubscriptionGuarantor resubscribing ".concat(n.identifier)),t.subscriptions.subscribe(n)}))}),500)}}])&&w(n.prototype,e),i&&w(n,i),t}();function C(t){return C="function"===typeof Symbol&&"symbol"===typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"===typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},C(t)}function T(t,n){for(var e=0;e<n.length;e++){var i=n[e];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(t,i.key,i)}}var P=function(){function t(n){!function(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}(this,t),this.consumer=n,this.guarantor=new A(this),this.subscriptions=[]}var n,e,i;return n=t,e=[{key:"create",value:function(t,n){var e=t,i="object"===C(e)?e:{channel:e},o=new S(this.consumer,i,n);return this.add(o)}},{key:"add",value:function(t){return this.subscriptions.push(t),this.consumer.ensureActiveConnection(),this.notify(t,"initialized"),this.subscribe(t),t}},{key:"remove",value:function(t){return this.forget(t),this.findAll(t.identifier).length||this.sendCommand(t,"unsubscribe"),t}},{key:"reject",value:function(t){var n=this;return this.findAll(t).map((function(t){return n.forget(t),n.notify(t,"rejected"),t}))}},{key:"forget",value:function(t){return this.guarantor.forget(t),this.subscriptions=this.subscriptions.filter((function(n){return n!==t})),t}},{key:"findAll",value:function(t){return this.subscriptions.filter((function(n){return n.identifier===t}))}},{key:"reload",value:function(){var t=this;return this.subscriptions.map((function(n){return t.subscribe(n)}))}},{key:"notifyAll",value:function(t){for(var n=this,e=arguments.length,i=new Array(e>1?e-1:0),o=1;o<e;o++)i[o-1]=arguments[o];return this.subscriptions.map((function(e){return n.notify.apply(n,[e,t].concat(i))}))}},{key:"notify",value:function(t,n){for(var e=arguments.length,i=new Array(e>2?e-2:0),o=2;o<e;o++)i[o-2]=arguments[o];return("string"===typeof t?this.findAll(t):[t]).map((function(t){return"function"===typeof t[n]?t[n].apply(t,i):void 0}))}},{key:"subscribe",value:function(t){this.sendCommand(t,"subscribe")&&this.guarantor.guarantee(t)}},{key:"confirmSubscription",value:function(t){var n=this;o.log("Subscription confirmed ".concat(t)),this.findAll(t).map((function(t){return n.guarantor.forget(t)}))}},{key:"sendCommand",value:function(t,n){var e=t.identifier;return this.consumer.send({command:n,identifier:e})}}],e&&T(n.prototype,e),i&&T(n,i),t}();function R(t,n){for(var e=0;e<n.length;e++){var i=n[e];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(t,i.key,i)}}var O=function(){function t(n){!function(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}(this,t),this._url=n,this.subscriptions=new P(this),this.connection=new g(this)}var n,e,i;return n=t,(e=[{key:"url",get:function(){return _(this._url)}},{key:"send",value:function(t){return this.connection.send(t)}},{key:"connect",value:function(){return this.connection.open()}},{key:"disconnect",value:function(){return this.connection.close({allowReconnect:!1})}},{key:"ensureActiveConnection",value:function(){if(!this.connection.isActive())return this.connection.open()}}])&&R(n.prototype,e),i&&R(n,i),t}();function _(t){if("function"===typeof t&&(t=t()),t&&!/^wss?:/i.test(t)){var n=document.createElement("a");return n.href=t,n.href=n.href,n.protocol=n.protocol.replace("http","ws"),n.href}return t}function j(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:E("url")||l.default_mount_path;return new O(t)}function E(t){var n=document.head.querySelector("meta[name='action-cable-".concat(t,"']"));if(n)return n.getAttribute("content")}}}]);
//# sourceMappingURL=vendors~actioncable-4bd3c02a52520de71d4f.chunk.js.map