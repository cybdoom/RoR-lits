function Contact(html) {
  var body = $(html),
      self = this;

  this.ui = {
    body:          body,
    deleteButton:  body.find('.delete-button')
  }

  function Remove() {
    var parent = body.parent();
    body.remove();
    var empty = parent.find('.contact').length <= 0;
    if (empty) parent.addClass('empty');
  }

  function SetEventHandlers() {
    self.ui.deleteButton.off().on('click', Remove);
  }

  SetEventHandlers();
}

$.each($('.contact'), function(i, element) { new Contact(element); });
