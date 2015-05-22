class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :annonces

  after_create :send_admin_mail
  def send_admin_mail
  	Mailer.welcome(self).deliver_now
  	if (User.count == 1)
  		HardWorker.perform_async
  	end
  end

  before_destroy :destroy_all_annonces_from_user
  def destroy_all_annonces_from_user
    @annonces = Annonce.where(user_id: self.id)
    @annonces.each do |annonce|
      annonce.destroy
    end 
  end
end
