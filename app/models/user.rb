class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail
  def send_admin_mail
  	Mailer.welcome(self).deliver_now
  	if (User.count == 1)
  		HardWorker.perform_async
  	end
  end
end
