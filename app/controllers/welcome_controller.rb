class WelcomeController < ApplicationController

  

  def index

    if (session[:user_id])
      @user         = User.find(session[:user_id])
      hospital_id   = @user.hospital_id
      @hospital     = Hospital.find(hospital_id)
    end

  end
end
