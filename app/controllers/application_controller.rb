class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :authorize, :logged_in?

  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/' unless current_user
  end
end
