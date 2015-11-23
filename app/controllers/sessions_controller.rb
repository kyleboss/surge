class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]     = user.id
      session[:hospital_id] = user.hospital_id
      session[:user_name]   = user.first_name
      redirect_to "/admin", notice: 'Logged in!'
    else
      render :new
    end
  end
  def destroy
    session[:user_id]     = nil
    session[:hospital_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
