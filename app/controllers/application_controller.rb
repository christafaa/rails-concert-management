class ApplicationController < ActionController::Base

  def home
    if session.has_key?(:user_id)
      user = User.find(session[:user_id])
      redirect_to user_path(user)
    else
      render :home
    end
  end

end
