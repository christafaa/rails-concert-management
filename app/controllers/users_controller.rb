class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @path = user_path(@user)
    @attendees, @sort_status = helpers.attendees_and_sort_status(@user.attendees, params[:sort])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
