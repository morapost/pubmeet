class PubsController < ApplicationController
  def index
  	@pubs = Pub.where('meet_time > ?', DateTime.now)
  end

  def show
  	@pub = Pub.find(params[:id])
  end
end
