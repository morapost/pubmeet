class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
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

  def edit
  	
  end

  def show
  	 
  end

  def update
  	if @event.update(event_params)
  		redirect_to @event, notice: "Successfully Updated Event!"
  	else
  		render 'edit'
  	end
  end

  def destroy
  	
  end

  private

	  def find_event
	  	@event = Event.find(params[:id])
	  end
	  	  		
	  def event_params
	  	params[:event].permit(:pub_id,:meet_time)
	  end

	  
end
