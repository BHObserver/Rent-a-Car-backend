class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.valid_password?(params[:password])
      sign_in @user, store: false
      render json: { message: 'Login successful', id: @user.id }, status: :ok # Include the user's ID in the response
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    sign_out current_user
    render json: { message: 'Logout successful' }, status: :ok
  end
end
