function startLogoDemo(obj) {
  lt = $('#logo_typing');
  lt.text("");
  lt.show();
  setTimeout('showLetter(0)', 100);
}

function showLetter(n) {
  lt = $('#logo_typing');
  if(lt.is(':visible')) {
    letters = 'Logic IT Staff'.split('')
    lt.text(lt.text() + letters[n]);
    var sound = new Audio('/sound/click.mp3');
    sound.play();            
    if(letters.length > n+1) {
      delay = 80 + Math.random()*100;  
      setTimeout(function() {showLetter(n+1)}, delay);
    }
  }
}

function stopLogoDemo() {
  $('#logo_typing').hide();
  $('#logo_typing').text("");
}


function startLogoDemo2() {
  var text = 'Logic IT Staff';
  delay = 100
  lt = $('#logo_typing');
  lt.text("");
  lt.show();
  $.each(text.split(''), function(i, letter){
    setTimeout(function(){
      lt.text(lt.text() + letter);
      var sound = new Audio('/sound/click.mp3');
      sound.play();            
    }, delay);
    delay = delay + 80 + Math.random()*100;  
  });
}
