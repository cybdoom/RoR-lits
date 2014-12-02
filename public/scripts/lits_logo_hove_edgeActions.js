
(function($,Edge,compId){var Composition=Edge.Composition,Symbol=Edge.Symbol;
//Edge symbol: 'stage'
(function(symbolName){Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",3457,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindTriggerAction(compId,symbolName,"Default Timeline",4201,function(sym,e){sym.stop();});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_cover}","mouseover",function(sym,e){sym.play("animation_in");sym.$("ea_sound")[0].currentTime=0;sym.$("ea_sound")[0].play();});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_cover}","mouseout",function(sym,e){sym.$("ea_sound")[0].pause();sym.play("animation_out");});
//Edge binding end
Symbol.bindElementAction(compId,symbolName,"${_cover}","click",function(sym,e){sym.$("ea_sound")[0].pause();sym.stop();window.location="/"});
})("stage");
//Edge symbol end:'stage'
})(jQuery,AdobeEdge,"ea_stage");