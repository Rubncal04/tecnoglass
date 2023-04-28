class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [ :login ]

  def login
    @user = User.find_by_email(params[:email]) || User.find_by_user_name(params[:user_name])

    if @user&.authenticate(params[:password])
      token = jwt_enconde(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
