class AttendeesController < ApplicationController
  def create
    attendee = Attendee.find_by(name: attendee_params[:name])
    concert = Concert.find(params[:concert_id])

    if attendee
      seat_number = params[:ticket][:seat_number]
      Ticket.create(concert: concert, attendee: attendee, seat_number: seat_number)
      redirect_to concert_path(concert)
    else
      attendee = Attendee.create(name: attendee_params[:name])
      redirect_to edit_concert_attendee_path(concert, attendee)
    end
  end

  def edit
    @attendee = Attendee.find(params[:id])
  end

  def update
    attendee = Attendee.find_by(id: params[:id]).update(attendee_params)
    concert = Concert.find(params[:concert_id])

    if attendee
      Ticket.create(concert: concert, attendee: attendee, seat_number: seat_number)
      redirect_to concert_path(concert)
    else
      redirect_to edit_concert_attendee_path(concert, attendee)
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
