class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail
  def send_admin_mail
  	puts ""
  	puts ""
  	puts "mail sent"
  	puts ""
  	puts ""
  	Mailer.welcome(self).deliver_now
  end
end
