class Api::V1::CarsController < ApplicationController
  # GET /cars
  # GET /cars/1
  def index
    if params[:id]
      @car = Car.find(params[:id])
      render json: @car
    else
      @cars = if params[:user_id]
                Car.where(user_id: params[:user_id])
              else
                Car.all.map { |car| car.attributes.merge(photo_url: url_for(car.photo)) } # Update to use photo_url
              end
      render json: { cars: @cars }
    end
  end



  def show
    @car = Car.find(params[:id])
  end

  # POST /cars
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @car = Car.find(params[:id])

    if @car.destroy
      render json: { message: 'Car deleted successfully' }, status: :no_content
    else
      render json: { error: 'Failed to delete car' }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:name, :model, :image, :description, :number_of_seats, :location, :fee, :reserved,
                                :user_id)
  end
end
