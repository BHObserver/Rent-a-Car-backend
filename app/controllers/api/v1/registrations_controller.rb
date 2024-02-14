<<<<<<<< HEAD:app/controllers/api/v1/registration_controller.rb
class Api::V1::RegistrationController < ApplicationController
========
class Api::V1::RegistrationsController < ApplicationController
>>>>>>>> feature/reservation:app/controllers/api/v1/registrations_controller.rb
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
