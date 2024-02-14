# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'associations' do
    it 'has many car_reservations' do
      # Creating a car instance
      car = Car.create(model: 'Test Model', make: 'Test Make', year: 2022)

      # Creating car_reservations associated with the car
      reservation1 = car.car_reservations.create
      reservation2 = car.car_reservations.create

      # Ensure the car_reservations association is set up correctly
      expect(car.car_reservations).to include(reservation1, reservation2)
    end
  end
end
