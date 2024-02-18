# spec/controllers/api/v1/cars_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON response with cars' do
      car = create(:car) # Assuming you have a factory for Car model
      get :index
      json_response = JSON.parse(response.body)
      expect(json_response['cars'].length).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      car = create(:car) # Assuming you have a factory for Car model
      get :show, params: { id: car.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new car' do
        car_params = attributes_for(:car) # Assuming you have a factory for Car model
        expect { post :create, params: { car: car_params } }.to change(Car, :count).by(1)
      end

      it 'returns a JSON response with the created car' do
        car_params = attributes_for(:car)
        post :create, params: { car: car_params }
        json_response = JSON.parse(response.body)
        expect(json_response['name']).to eq(car_params[:name])
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new car' do
        car_params = { name: nil } # Invalid parameters
        expect { post :create, params: { car: car_params } }.not_to change(Car, :count)
      end

      it 'returns a JSON response with errors' do
        car_params = { name: nil } # Invalid parameters
        post :create, params: { car: car_params }
        json_response = JSON.parse(response.body)
        expect(json_response).to have_key('errors')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the car' do
      car = create(:car) # Assuming you have a factory for Car model
      expect { delete :destroy, params: { id: car.id } }.to change(Car, :count).by(-1)
    end
  end
end
