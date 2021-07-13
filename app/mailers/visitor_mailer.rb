class VisitorMailer < ApplicationMailer
  def contact_mail(name, email, message)
    @email = email
    @name = name
    @message = message
    mail(to: @email, subject: 'Welcome to My Awesome Feature')
  end
end
