class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail
  def send_admin_mail
  	# Mailer.welcome(self).deliver_now
  	HardWorker.perform_async 'http://www.leboncoin.fr/voitures/offres/aquitaine/?f=a&th=1&q=peugeot&location=33300'
  end
end
