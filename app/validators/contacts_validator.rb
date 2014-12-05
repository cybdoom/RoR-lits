class ContactsValidator < ActiveModel::Validator
  PHONE_REGEXP = /\d{10}/

  def validate record
    if record.contacts[:phone].to_s.empty?
      record.errors[:base] << I18n.t('error.validation.reply.contacts.phone.absent')
    elsif !(PHONE_REGEXP === record.contacts[:phone])
      record.errors[:base] << I18n.t('error.validation.reply.contacts.wrong_value')
    end
  end
end
