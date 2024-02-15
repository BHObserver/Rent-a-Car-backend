# app/controllers/api/v1/reservations_controller.rb
class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  # GET /reservations
  def index
    @reservations = CarReservation.all
    render json: @reservations
  end

  # GET /reservations/1
  def show
    render json: @reservation
  end

  # POST /reservations
  def create
    @reservation = CarReservation.new(reservation_params)

    if car_available?(@reservation.car_id, @reservation.start_time, @reservation.end_time) && @reservation.save
      update_car_availability(@reservation.car_id)
      render json: @reservation, status: :created
    else
      render json: { error: 'Car is not available for the specified time period' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1
  def update
    if @reservation.update(reservation_params)
      update_car_availability(@reservation.car_id)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservations/1
  def destroy
    if @reservation.destroy
      update_car_availability(@reservation.car_id)
      render json: { message: 'Reservation deleted successfully' }, status: :no_content
    else
      render json: { error: 'Failed to delete Reservation' }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = CarReservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:reserved_date, :start_time, :end_time, :total_cost, :start_location,
                                        :destination, :user_id, :car_id, :name) # Changed aeroplane_id to car_id
  end

  # Check if the car is available for reservation
  def car_available?(car_id, start_time, end_time)
    Car.find(car_id).available_for_reservation?(start_time, end_time)
  end

  # Update car availability after reservation creation or deletion
  def update_car_availability(car_id)
    car = Car.find(car_id)
    car.update(available: car.available_for_reservation?(car_reservations.start_time, car_reservations.end_time))
  end
end
