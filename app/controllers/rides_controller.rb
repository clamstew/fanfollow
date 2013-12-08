class RidesController < ApplicationController

  def show
    @ride = Ride.find(params[:id])
  end

  def index
    @ride = Ride.all
  end

  def new
      @ride = Ride.new(params[:ride_params])
      @event = Event.find(params[:event_id])
  end

  def create
    @ride = Ride.new(params[:ride_params])
    @ride.event = Event.find(params[:event_id])
    @ride.user_id = current_user.id
    if @ride.save
      redirect_to @ride
    else
      render 'new'
    end
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def update
    @ride = Ride.find(params[:id])
    @ride.update(ride_params)
    redirect_to root_path
  end

  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy
    redirect_to root_path
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :event_id)
  end

end