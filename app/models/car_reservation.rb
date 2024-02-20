class CarReservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  after_create :update_car_availability
  before_destroy :restore_car_availability

  private

  def update_car_availability
    car.update(available: false) if car.present?
  end

  def restore_car_availability
    car.update(available: true) if car.present?
  end
end
