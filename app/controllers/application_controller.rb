class ApplicationController < ActionController::API
  include ActionController::Helpers
  helper_method :current_user 
  acts_as_token_authentication_handler_for User, fallback: :none
  include Response
  include ExceptionHandler

  private
 
  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end