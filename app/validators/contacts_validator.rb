class ContactsValidator < ActiveModel::Validator
  SKYPE_REGEXP = /^[a-zA-Z][a-zA-Z0-9\.,\-_]{5,31}$/

  def validate record
    @record = record
    @contacts = @record.contacts.is_a?(String) ? JSON.parse(@record.contacts) : @record.contacts
    record.errors.add :contacts, I18n.t('errors.validation.reply.contacts.email.no_one') unless at_least_one_valid_email_present?
    validate_each_contact
  end

  def at_least_one_valid_email_present?
    @contacts.each { |contact| return true if contact['type'] == 'email' && EmailValidator.valid?(contact['value']) }

    false
  end

  private

  def validate_each_contact
    @contacts.each { |contact| self.send("validate_#{ contact['type'] }", contact['value']) }
  end

  def validate_email value
    @record.errors.add :contacts, I18n.t('errors.validation.reply.contacts.email.invalid', { email: value }) unless EmailValidator.valid? value
  end

  def validate_phone value
    @record.errors.add :contacts, I18n.t('errors.validation.reply.contacts.phone.invalid', { phone: value }) unless Phoner::Phone.valid? value
  end

  def validate_skype value
    @record.errors.add :contacts, I18n.t('errors.validation.reply.contacts.skype.invalid', { skype: value }) unless SKYPE_REGEXP === value
  end
end
