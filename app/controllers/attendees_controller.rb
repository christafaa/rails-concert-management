class AttendeesController < ApplicationController
  def new
    #maybe use this with form_for in concert show page?
  end

  def create
    attendee = Attendee.find_by(first_name: attendee_params[:first_name], last_name: attendee_params[:last_name])
    concert = Concert.find(params[:concert_id])
    seat_number = params[:ticket][:seat_number]

    if attendee
      Ticket.create(concert: concert, attendee: attendee, seat_number: seat_number)
      redirect_to concert_path(concert)
    else
      attendee = Attendee.create(first_name: attendee_params[:first_name], last_name: attendee_params[:last_name])
      Ticket.create(concert: concert, attendee: attendee, seat_number: seat_number)
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
      redirect_to concert_path(concert)
    else
      redirect_to edit_concert_attendee_path(concert, attendee)
    end
  end

  def show
    @attendee = Attendee.find(params[:id])
  end

  def index
    if params[:sort]
      if params[:sort] == "Alpha"
        @attendees = Attendee.alpha
      elsif params[:sort] == "Best Wealth Rating"
        @attendees = Attendee.best_wealth_rating
      elsif params [:sort] == "Most Tickets"
        @attendees = Attendee.most_tickets
      end
    else
      @attendees = Attendee.all
    end
  end

  def destroy

  end

  private

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :profession, :age, :wealth_rating, :notes, :user_id)
  end
end
