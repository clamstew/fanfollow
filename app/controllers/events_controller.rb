class EventsController < ApplicationController

  def show
    @events = Event.find(params[:id])
    @event = Event.find(params[:id])
    @ride = Event.find(params[:id])
    @rides = Ride.all
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    # If you want to store who created this event, write @event.user_id = current_user.id
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :image_id, :date, :location)
  end

end
