class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.create(concert_params)

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

    @attendees, @sort_status = helpers.attendees_and_sort_status(@concert.attendees, params[:sort])
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

  def destroy
    @concert = Concert.find(params[:id])
  end

  private

  def concert_params
    params.require(:concert).permit(:title, :venue, :date)
  end
end
