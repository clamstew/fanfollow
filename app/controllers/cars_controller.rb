class CarsController < ApplicationController

  def show
    @car = Car.find(params[:id])
  end

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    if @car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  def edit
    @car = car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to root_path
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to root_path
  end

  private
  def car_params
    params.require(:car).permit(:seats)
  end

end
