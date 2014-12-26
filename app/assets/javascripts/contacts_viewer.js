function ContactsViewer(html) {
  var body = $(html),
      self = this;

  self.ui = {
    body:             body,
    newContactPanel:  body.find('.new-contact'),
    contactTypes:     body.find('.contact-type-option'),
    contactType:      body.find('.contact-type-options'),
    contactValue:     body.find('.contact-value input'),
    contactsList:     body.find('.contacts-list'),
    addButton:        body.find('.add-button'),
    validationError:  body.find('.validation-error')
  }

  self.model = {
    newContact: {
      type: 'email',
      value: ''
    }
  }

  function ValidateNewContact() {
    var isValid = self.model.newContact.value.length > 0;

    if (isValid)
      self.ui.validationError.fadeOut();
    else
      self.ui.validationError.fadeIn();

    return isValid;
  }

  function AddContact() {
    var OnSuccessfullResponse = function(response) {
      self.ui.newContactPanel.slideUp();
      self.ui.addButton.removeClass('on').addClass('off');
      self.ui.contactsList.append(response);
      self.ui.contactsList.removeClass('empty');
    };

    $.ajax({
      method: 'GET',
      url:    '/contact',
      data: {
        contact: self.model.newContact
      },
      success: OnSuccessfullResponse
    })
  }

  function OnAddButtonClicked() {
    var was    = self.ui.newContactPanel.is(':visible') ? 'on' : 'off';
    if (was == 'off') {
      self.ui.newContactPanel.slideDown();
      self.ui.addButton.removeClass(was).addClass('on');
    } else if (was == 'on' && ValidateNewContact())
      AddContact();
    else
      self.ui.validationError.html('Please enter valid contact');
  }

  function OnContactTypeClicked() {
    var oldType = self.ui.contactType.attr('value');

    self.model.newContact.type = $(this).attr('value');
    self.ui.contactType.attr('value', self.model.newContact.type );

    self.ui.contactTypes.parent().find('[value="' + oldType + '"]').removeClass('selected');
    $(this).addClass('selected');
  }

  function OnContactValueUpdated() {
    self.model.newContact.value = this.value;
  }

  function SetEventHandlers() {
    self.ui.addButton.off().on('click', OnAddButtonClicked);
    self.ui.contactTypes.off().on('click', OnContactTypeClicked);
    self.ui.contactValue.off().on('keyup change', OnContactValueUpdated);
  }

  SetEventHandlers();
}

$(function() {
  $.each($('.contacts'), function(i, element) { new ContactsViewer(element); });
});
