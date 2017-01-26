class PubsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  def index
  	@pub = Pub.all.order('meet_time').first
    @events = @pub.events.includes(:invites)
    # TODO 
    @prev_pub = # TODO ??
    @next_pub = # TODO ??
    render 'show'    
  end

  def show
  	@pub = Pub.find(params[:id])
  	@events = @pub.events.includes(:invites)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
