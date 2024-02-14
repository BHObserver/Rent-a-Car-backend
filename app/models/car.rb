# app/models/car.rb
class Car < ApplicationRecord
  belongs_to :user
  has_many :car_reservations

end
