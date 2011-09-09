class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?, :verify_authentication
  
  protected
  def verify_authentication
    redirect_to root_url, :alert => "You need to be logged in to do that." unless logged_in?
  end
  
  def logged_in?
    current_user.present?
  end
  
  def current_user
    if session[:user_id].present?
      @user ||= User.find(session[:user_id])
    end
  end
end
