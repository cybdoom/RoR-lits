class SupportMailer < ActionMailer::Base
  default from: 'from@logic-it-solutions.com'

  def contacts_email(name, email, phone, message)
    @name = name
    @email = email
    @phone = phone
    @message = message
    mail(to: 'office@logic-it-solutions.com', subject: 'New contact')
  end
end