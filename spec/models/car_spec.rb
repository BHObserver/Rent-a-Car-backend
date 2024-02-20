# spec/models/car_spec.rb
require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it 'is not valid without a name' do
      car = Car.new(name: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without a photo' do
      car = Car.new(photo: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without details' do
      car = Car.new(details: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without a city' do
      car = Car.new(city: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without a model' do
      car = Car.new(model: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without a cost' do
      car = Car.new(cost: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid with a cost less than 1' do
      car = Car.new(cost: 0)
      expect(car).not_to be_valid
    end
  end
end
