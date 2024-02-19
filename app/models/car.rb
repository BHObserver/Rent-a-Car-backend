class Car < ApplicationRecord
  belongs_to :user
  has_many :car_reservations

  scope :available, -> { where(available: true) }
end
