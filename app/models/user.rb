class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
   		 :omniauthable,:omniauth_providers => [:google_oauth2]	

	has_many :invites
	#after_create :send_registration_mail

	def self.from_omniauth(auth)
		user = User.where(email: auth.info.email).first

		if user
			return user
		else
			where(provider: auth.provider,uid: auth.uid).first_or_create do |user|
				user.name = auth.info.name
				user.provider = auth.provider
				user.uid = auth.uid
				user.email = auth.info.email
				user.avatar_url = auth.info.image
				user.password = Devise.friendly_token[0,20]
			end
		end
	end

	def random_pub
		
	end

	private
	
	  def send_registration_mail
	    UserMailer.user_created(self).deliver
	  end

end
