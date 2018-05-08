class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.new_user.subject
  #
  def new_user
    @user = User.last
    mail to: @user.email_address, subject: "Welcome to D&D Encounter Generator!"
  end
end
