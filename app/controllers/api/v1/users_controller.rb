class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [ :create ]

  def show
    render json: { user: @current_user }, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      token = jwt_enconde(user_id: @user.id)
      render json: { user: @user, token: token }, status: :created
    else
      render json: { errors: "Something went wrong." }, status: :unprocessable_entity
    end
  end

  def update
    @current_user.update!(user_params) 
    render json: { message: "User successfully updated", user: @current_user }, status: :ok
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :user_name,
      :email,
      :password
    )
  end
end
