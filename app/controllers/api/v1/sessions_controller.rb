class Api::V1::SessionsController < ApplicationController
  def index
    @session = Session.all
    json_response(@session)
  end

  def create 
    user = User.where(email: params[:email]).first

    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:email, :authentication_token, :id]), status: :created
    else 
      head[:unauthorized]
    end
  end
  
  def destroy
    current_user&.authentication_token = nil
    if current_user.save
      head(:ok)
    else  
      head(:unauthorized)
    end
  end
end