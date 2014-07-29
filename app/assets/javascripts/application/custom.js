/*=========================================================================
 Div Effects
========================================================================= */

!function(t) {
t.fn.unveilEffect=function(n, i) {
function e() {
s=a.filter(function() {
var n=t(this), i=o.scrollTop(), e=i+o.height(), f=n.offset().top, s=f+n.height();
return s>=i-r&&e+r>=f
}
), f=s.trigger("unveil.effect"), a=a.not(f)
}
var f, s, o=t(window), r=i||0, a=this;
return this.one("unveil.effect", n), o.scroll(e).resize(e).load(e), this
}, unveilEffectSettings=t.extend( {
transitionDuration:1, transitionEasing:"ease-in-out", selector:"[data-effect]", threshold:200
}, "undefined"!=typeof unveilEffectSettings?unveilEffectSettings:!1), t(function() {
if(t.fn.unveilEffect.transition=function() {
var t=document.createElement("bs"), n= {
WebkitTransition:"-webkit-transition", MozTransition:"-moz-transition", OTransition:"-o-transition", transition:"-transition"
};
for(var i in n)if(void 0!==t.style[i])return {
css:n[i]
}
}
(), t.fn.unveilEffect.transition) {
var n=t(unveilEffectSettings.selector);
n.each(function() {
var n=t(this), i=n.data("effect");
n.addClass("effect-"+i)[0].offsetWidth, n.css(t.fn.unveilEffect.transition.css, "all "+unveilEffectSettings.transitionDuration+"s "+unveilEffectSettings.transitionEasing)
}
)
.unveilEffect(function() {
t(this).addClass("in")
},
-unveilEffectSettings.threshold)
}
}
)
}
(window.jQuery);

