function Reply(html) {
  var body = $(html),
      self = this;

  this.ui = {
    body:            body,
    applyButton:     body.find('.apply-button'),
    fileIcon:        body.find('.file-icon'),
    fileInput:       body.find('.attach-and-apply input'),
    form:            body.find('form'),
    contactsInput:   body.find('#reply_contacts')
  }

  function UpdateFileIconClass() {
    if (self.ui.fileInput[0].files.length <= 0) {
      self.ui.fileIcon.addClass('empty');
      return false;
    } else
      self.ui.fileIcon.removeClass('empty');
      return true;
  }

  function UpdateContactsInput() {
    var contacts = [];
    $.each($('.contact'), function(i, element) {
      contacts.push({
        type:   $(element).find('.contact-type').attr('value'),
        value:  $(element).find('.contact-value').attr('value')
      });
    });
    self.ui.contactsInput.attr('value', JSON.stringify(contacts));
  }

  function OnApplyButtonClick(e) {
    if (UpdateFileIconClass()) {
      UpdateContactsInput();
      self.ui.form.submit();
    }
  }

  function OnFileInputChanged() {
    UpdateFileIconClass();
  }

  function SetEventHandlers() {
    self.ui.applyButton.off().on('click', OnApplyButtonClick);
    self.ui.fileInput.off().on('change', OnFileInputChanged);
  }

  SetEventHandlers();
}

$(function() {
  $.each($('.reply'), function(i, element) {
    new Reply(element);
  });
});
