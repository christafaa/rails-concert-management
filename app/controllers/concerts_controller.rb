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

    if params[:sort]
      case params[:sort]
        when "Alpha" then @attendees = @concert.attendees.alpha.uniq
        when "Best Wealth Rating" then @attendees = @concert.attendees.best_wealth_rating.uniq
        when "Most Tickets" then @attendees = @concert.attendees.most_tickets.uniq
      end
    else
      @attendees = @concert.attendees.alpha.uniq
    end
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
