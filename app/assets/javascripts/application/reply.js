function Reply(html) {
  var body = $(html),
      self = this;

  this.ui = {
    body:                 body,
    applyButton:          body.find('.apply-button'),
    fileIcon:             body.find('.file-icon'),
    fileInput:            body.find('.cv input'),
    form:                 body.find('form'),
    contactsInput:        body.find('#reply_contacts'),
    workHoursInput:       body.find('.work-hours'),
    remoteCheckbox:       body.find('.work-type-option-remote'),
    dobHiddenInput:       body.find('#reply_dob'),
    dobInput:             body.find('.dob-input'),
    workTypeCheckboxes:   body.find('.work-type-option'),
    workTypesHiddenInput: body.find('#reply_work_types')
  }

  function UpdateIcons() {
    if (self.ui.fileInput[0].files.length <= 0) {
      self.ui.fileIcon.addClass('empty');
      self.ui.applyButton.addClass('disabled')
      return false;
    } else {
      self.ui.fileIcon.removeClass('empty');
      self.ui.applyButton.removeClass('disabled')
      return true;
    }
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
    if (UpdateIcons()) {
      UpdateContactsInput();
      self.ui.form.submit();
    }
  }

  function OnFileInputChanged() {
    UpdateIcons();
  }

  function ToggleWorkHoursField() {
    self.ui.workHoursInput.attr('readonly', self.ui.workHoursInput.attr('readonly') == 'readonly' ? null : 'readonly')
  }

  function SetDob() {
    self.ui.dobHiddenInput.attr('value', self.ui.dobInput.val());
  }

  function SetWorkTypes(e) {
    var workTypes = [];
    $.each(self.ui.workTypeCheckboxes, function(i, checkbox) {
      if ($(checkbox).prop('checked')) workTypes.push($(checkbox).attr('value'));
    });
    self.ui.workTypesHiddenInput.attr('value', JSON.stringify(workTypes));
  }

  function SetEventHandlers() {
    self.ui.applyButton.off().on('click', OnApplyButtonClick);
    self.ui.fileInput.off().on('change', OnFileInputChanged);
    self.ui.remoteCheckbox.off().on('change', ToggleWorkHoursField);
    self.ui.workTypeCheckboxes.on('change', SetWorkTypes);
    self.ui.dobInput.off().on('change', SetDob);
  }

  SetEventHandlers();
}

$(function() {
  $.each($('.reply'), function(i, element) {
    new Reply(element);
  });
});
