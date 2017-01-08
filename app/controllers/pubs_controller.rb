class PubsController < ApplicationController
  def index
  	@pubs = Pub.where('meet_time > ?', DateTime.now)
  end

  def show
  	@pub = Pub.find(params[:id])
  	@invite = Invite.find(params[:invite_id]) if params.key? :invite_id
  end
end
