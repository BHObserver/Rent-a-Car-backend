# spec/controllers/api/v1/cars_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  describe 'GET #index' do
    it 'returns a list of cars' do
      car1 = FactoryBot.create(:car)
      car2 = FactoryBot.create(:car)

      get :index

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['cars']).to contain_exactly(
        JSON.parse(car1.to_json),
        JSON.parse(car2.to_json)
      )
    end

    it 'returns a specific car when id is provided' do
      car = FactoryBot.create(:car)

      get :index, params: { id: car.id }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(JSON.parse(car.to_json))
    end

    it 'returns cars associated with a user when user_id is provided' do
      user = FactoryBot.create(:user)
      car1 = FactoryBot.create(:car, user: user)
      car2 = FactoryBot.create(:car, user: user)

      get :index, params: { user_id: user.id }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['cars']).to contain_exactly(
        JSON.parse(car1.to_json),
        JSON.parse(car2.to_json)
      )
    end
  end

  describe 'GET #show' do
    it 'returns a specific car with photo URL' do
      car = FactoryBot.create(:car)
      
      get :show, params: { id: car.id }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['photo']).to eq(url_for(car.photo))
    end
  end

  describe 'POST #create' do
    it 'creates a new car' do
      car_params = FactoryBot.attributes_for(:car)

      post :create, params: { car: car_params }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to include(car_params.stringify_keys)
    end

    it 'returns unprocessable entity when invalid data is provided' do
      post :create, params: { car: { name: '' } }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a car' do
      car = FactoryBot.create(:car)

      delete :destroy, params: { id: car.id }

      expect(response).to have_http_status(:no_content)
    end

    it 'returns unprocessable entity when deletion fails' do
      allow_any_instance_of(Car).to receive(:destroy).and_return(false)
      car = FactoryBot.create(:car)

      delete :destroy, params: { id: car.id }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
