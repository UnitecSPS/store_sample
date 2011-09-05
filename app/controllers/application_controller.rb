class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?
  
  protected
  def logged_in?
    current_user.present?
  end
  
  def current_user
    if session[:user_id].present?
      @user ||= User.find(session[:user_id])
    end
  end
end
