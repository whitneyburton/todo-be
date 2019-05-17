class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]

  def index 
    json_response(User.all)
  end

  def show 
    user = User.find(params[:id])
    json_response(user)
  end

  def create 
    user = User.new(user_params)

    if user.save
      render :create
    else  
      head(:unprocessable_entity)
    end
  end
  
  private 

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
