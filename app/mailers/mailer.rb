class Mailer < ActionMailer::Base
  default from: 'LanglePasTropMal@temp.com'

  def welcome(user)
    @user = user
    mail(to: @user.email,
         subject: 'Welcome to our site')
  end

  def nouvelleAnnonce(user)
    puts "mail"
  	@user = user
  	mail(to: @user.email,
  		subject: 'Une nouvelle annonce a été postée, et elle correspond à l\'une de vos recherche')
  end
end