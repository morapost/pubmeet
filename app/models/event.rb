class Event < ActiveRecord::Base
	belongs_to :pub
	belongs_to :user
	has_many :invites
	after_create :send_invitations

	def send_invitations
		#Get all users
		users = User.all
		users.each do |user|
			invite = Invite.create(event: self, user: user)
		end		
	end
end



