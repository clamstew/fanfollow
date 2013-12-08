class PassengersController < ApplicationController

  def show
    @passenger = Passenger.find(params[:id])
  end

  def index
    @passengers = Passenger.all
  end

  def new
      @passenger = Passenger.new
      @ride = Ride.find(params[:ride_id])
      @user = current_user.id
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to @passenger
    else
      render 'new'
    end
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.update(passenger_params)
    redirect_to root_path
  end

  def destroy
    @passenger = Passenger.find(params[:id])
    @passenger.destroy
    redirect_to root_path
  end

  private
  def passenger_params
    params.require(:passenger).permit(:ride_id, :user_id)
  end

end