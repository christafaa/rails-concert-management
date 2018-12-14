class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      redirect_to concert_path(@concert)
    else
      render :new
    end
  end

  def index
    @concerts = Concert.all
  end

  def edit
    @concert = Concert.find(params[:id])
  end

  def show
    @concert = Concert.find(params[:id])
    @path = "/concerts/#{@concert.id}/attendees/sort"
    collection = Attendee.collection_of(@concert)
    @attendees, @sort_status = helpers.attendees_and_sort_status(collection, "Alphabetical")
  end

  def sort_attendees
    concert = Concert.find(params[:id])
    collection = Attendee.collection_of(concert)
    attendees, sort_status = helpers.attendees_and_sort_status(collection, params[:sort])
    serialized_attendees = attendees.map {|attendee| AttendeesSerializer.new(attendee)}
    render json: {attendees: serialized_attendees, path: "/concerts/#{concert.id}/attendees/sort", sort_status: sort_status}
  end

  def update
    @concert = Concert.find(params[:id])
    @concert.update(concert_params)

    if @concert.save
      redirect_to concert_path(@concert)
    else
      render :edit
    end
  end

  private

  def concert_params
    params.require(:concert).permit(:title, :venue, :date)
  end
end
