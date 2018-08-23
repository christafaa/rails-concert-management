class AttendeesController < ApplicationController
  def create
    attendee = Attendee.find_by(name: attendee_params[:name])

    if attendee
      concert = Concert.find(params[:concert_id])
      Ticket.create(concert: concert, attendee: attendee, seat_number: params[:ticket][:seat_number])
      redirect_to concert_path(concert)
    else
      @attendee = Attendee.create(name: attendee_params[:name])
      render :edit
    end
  end

  def edit
    @attendee = Attendee.find(params[:id])
  end

  def update
    binding.pry
    @attendee = Attendee.find(params[:id]).update(attendee_params)

    if @attendee.save
      redirect_to
    else

    end
  end

  def show
    @attendee = Attendee.find(params[:id])
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
