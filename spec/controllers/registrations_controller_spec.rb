require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :controller do
  render_views

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new user' do
        user_params = { email: 'test@example.com', password: 'password', password_confirmation: 'password',
                        username: 'testuser' }
        expect do
          post :create, params: { user: user_params }
        end.to change(User, :count).by(1)
        expect(session[:user_id]).to eq(User.last.id) # Ensure user is logged in
        expect(response).to have_http_status(:created)
      end

      it 'returns a success message' do
        user_params = { email: 'test@example.com', password: 'password', password_confirmation: 'password',
                        username: 'testuser' }
        post :create, params: { user: user_params }
        expect(JSON.parse(response.body)['message']).to eq('User created successfully')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new user' do
        user_params = { email: 'invalid_email', password: 'password', password_confirmation: 'password',
                        username: 'testuser' }
        expect do
          post :create, params: { user: user_params }
        end.to_not change(User, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors message' do
        user_params = { email: 'invalid_email', password: 'password', password_confirmation: 'password',
                        username: 'testuser' }
        post :create, params: { user: user_params }
        expect(JSON.parse(response.body)['errors']).to include('Email is invalid')
      end
    end
  end
end
