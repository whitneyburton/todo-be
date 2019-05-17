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
  
  private 

  def user_params
    params.permit(:title, :created_by)
  end
end
