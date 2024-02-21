require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  render_views

  describe 'GET #index' do
    it 'returns a list of users' do
      User.create(username: 'user1', email: 'user1@example.com', password: 'password',
                  password_confirmation: 'password')
      User.create(username: 'user2', email: 'user2@example.com', password: 'password',
                  password_confirmation: 'password')
      get :index
      expect(JSON.parse(response.body).count).to eq(2)
    end
  end

  describe 'GET #show' do
    it 'returns the requested user' do
      user = User.create(username: 'testuser', email: 'test@example.com', password: 'password',
                         password_confirmation: 'password')
      get :show, params: { id: user.id }
      expect(JSON.parse(response.body)['username']).to eq('testuser')
    end
  end

  describe 'POST #create' do
    it 'creates a new user with valid parameters' do
      user_params = { username: 'testuser', email: 'test@example.com', password: 'password',
                      password_confirmation: 'password' }
      expect do
        post :create, params: { user: user_params }
      end.to change(User, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it 'returns errors with invalid parameters' do
      user_params = { email: 'invalid_email', password: 'password', password_confirmation: 'password',
                      username: 'testuser' }
      post :create, params: { user: user_params }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH #update' do
    it 'updates the user with valid parameters' do
      user = User.create(username: 'testuser', email: 'test@example.com', password: 'password',
                         password_confirmation: 'password')
      new_username = 'updated_user'
      patch :update, params: { id: user.id, user: { username: new_username } }
      expect(User.find(user.id).username).to eq(new_username)
    end

    it 'returns errors with invalid parameters' do
      user = User.create(username: 'testuser', email: 'test@example.com', password: 'password',
                         password_confirmation: 'password')
      patch :update, params: { id: user.id, user: { email: 'invalid_email' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
