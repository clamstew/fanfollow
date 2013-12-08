class RidesController < ApplicationController

  def show
    @ride = Ride.find(params[:id])
  end

  def index
    @ride = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    # If you want to store who created this ride, write @ride.user_id = current_user.id
    if @ride.save
      redirect_to @event
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
