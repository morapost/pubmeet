class InvitesController < ApplicationController

	def index
		@invites = Invite.all
	end

	def edit
		@invite = Invite.find(params[:id])
	end
	
	def update
		@invite = Invite.find(params[:id])
		@invite.update_attributes(accepted: !@invite.accepted)
    if !@invite.accepted
			redirect_to :back, notice: "You are in for party"
  	else
			redirect_to :back, notice: "Hope to see you again"
		end
	end
end
