class Car < ApplicationRecord
  belongs_to :user
  has_many :car_reservations

  validates :name, presence: true
  validates :photo, presence: true
  validates :details, presence: true
  validates :city, presence: true
  validates :model, presence: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 1 }

end
