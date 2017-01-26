class Invite < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	after_create :send_mail

	#validations
	validates_uniqueness_of :user_id, :scope => :event_id

	def send_mail
		WeeklyEvent.invitation_mail(self).deliver
	end

  def opposite_state
    accepted == true ? "Decline" : "Accept"
  end
end
