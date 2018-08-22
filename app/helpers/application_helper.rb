module ApplicationHelper
  def display_user(session)
    User.find(session[:user_id]).username
  end
end
