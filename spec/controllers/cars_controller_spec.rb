require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  render_views

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'does not create a new car with invalid attributes' do
      car_params = { name: nil, photo: nil, details: nil, city: nil, model: nil, cost: nil }
      expect do
        post :create, params: { car: car_params }
      end.to_not change(Car, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
