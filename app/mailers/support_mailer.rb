class SupportMailer < ActionMailer::Base
  default from: 'form@logicitstaff.com'

  def contacts_email(name, email, phone, message)
    @name = name
    @email = email
    @phone = phone
    @message = message
    mail(to: 'office@logicitstaff.com', subject: 'New contact')
  end
end