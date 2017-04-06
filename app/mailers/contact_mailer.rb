class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.user_send_contact.subject
  #
  def user_send_contact(contact)

    @contact = contact

    mail(to: "nguyenphuoctiendn@gmail.com", subject: "test")
  end
end
