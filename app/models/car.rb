# app/models/car.rb
class Car < ApplicationRecord
  belongs_to :user
  has_many :car_reservations

  # Check if the car is available for reservation
  def available_for_reservation?(start_time, end_time)
    car_reservations.where.not(
      "(start_time >= ? AND start_time < ?) OR (end_time > ? AND end_time <= ?) OR (start_time <= ? AND end_time >= ?)",
      end_time, start_time,
      start_time, end_time,
      start_time, end_time
    ).empty?
  end
end
