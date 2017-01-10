class EventsController < ApplicationController
  def index
  	@events = Event.all
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
  		redirect_to events_path, notice: "Successfully created Event for (#{@event.pub.name})"
  	else
  		render 'new'
  	end
  end

  private
	  def event_params
	  	params[:event].permit(:pub_id,:meet_time)
	  end
end
