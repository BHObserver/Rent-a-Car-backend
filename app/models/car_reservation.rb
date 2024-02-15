# app/models/car_reservation.rb
class CarReservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  after_create :update_car_availability
  after_destroy :update_car_availability

  private

  # Update car availability after reservation creation or deletion
  def update_car_availability
    car.update(available: car.available_for_reservation?(start_time, end_time))
  end
end
