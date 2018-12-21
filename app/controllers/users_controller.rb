class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

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
  end

  def sort_attendees
    user = User.find(params[:id])
    collection = Attendee.collection_of(user)
    attendees, sort_status = helpers.attendees_and_sort_status(collection, params[:sort])
    serialized_attendees = attendees.map {|attendee| AttendeesSerializer.new(attendee)}
    render json: {attendees: serialized_attendees, path: "/users/#{user.id}/attendees/sort", sort_status: sort_status}
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
