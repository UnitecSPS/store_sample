class UserSessionsController < ApplicationController
  def new
    redirect_to root_url, :alert => "Already Logged In" if current_user.present?
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Logged In!"
    else
      flash.now.alert = "Invalid Email or Password"
      render "new"
    end
  end

  def destroy
    if current_user.present?
      session[:user_id] = nil
      redirect_to root_url, :notice => "Logged out!"
    else
      redirect_to :root_url, :alert => "You need to be logged in to be able to log out."
    end
  end

end
