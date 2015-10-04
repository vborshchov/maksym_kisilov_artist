class ContactMailer < ApplicationMailer
  default to: "izhachok89@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_email.subject
  #
  def contact_email(message)
    @message = message
    mail(from: @message.email, subject: @message.title)
  end
end
