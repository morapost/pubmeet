class InvitesController < ApplicationController

	def edit
		@invite = Invite.find(params[:id])
	end
	def update
		@invite = Invite.find(params[:id])
		if !@invite.accepted
			@invite.update_attributes(accepted: true)
			redirect_to :back, notice: "You are in for party"
  		else
  			@invite.update_attributes(accepted: false)
  			redirect_to :back, notice: "Hope to see you again"
  		end
	end
end
