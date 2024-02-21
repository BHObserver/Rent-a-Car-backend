require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it 'is not valid without a name' do
      car = Car.new(name: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without a photo_url' do
      car = Car.new(photo_url: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without details' do
      car = Car.new(available: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without a make' do
      car = Car.new(make: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without a model' do
      car = Car.new(model: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid without a cost' do
      car = Car.new(year: nil)
      expect(car).not_to be_valid
    end

    it 'is not valid with a cost less than 1' do
      car = Car.new(year: 0)
      expect(car).not_to be_valid
    end
  end
end
