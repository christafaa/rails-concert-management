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

    if params[:sort]
      case params[:sort]
        when "Alpha" then @attendees = @user.attendees.alpha
        when "Best Wealth Rating" then @attendees = @user.attendees.best_wealth_rating
        when "Most Tickets" then @attendees = @user.attendees.most_tickets
      end
    else
      @attendees = @user.attendees.alpha
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
