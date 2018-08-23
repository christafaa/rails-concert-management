class AttendeesController < ApplicationController
  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.create(attendee_params)

    if @attendee.save
      redirect_to attendee_path(@attendee)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def show

  end

  def index
    @attendees = Attendee.all
  end

  def destroy

  end

  private

  def attendee_params
    params.require(:attendee).permit(:name, :profession, :age, :wealth_rating, :notes, :user_id)
  end
end
