class Mailer < ApplicationMailer
  default from: 'LanglePasTropMal@temp.com'

  def welcome(user)
    @user = user
    mail(to: @user.email,
         subject: 'First test mail')
  end
end