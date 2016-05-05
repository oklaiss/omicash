class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # need to make this check to see if login passed for venmo
  def venmo_user
    @current_user ||= User.find(session[:user_id]) if User.find(session[:user_id]).venmo_username != nil
  end
  helper_method :venmo_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def venmo_authorize
    # redirect_to '/venmo' unless venmo_user
  end
end
