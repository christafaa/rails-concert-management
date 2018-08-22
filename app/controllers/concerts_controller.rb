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
  end

  def update

  end

  def destroy
    @concert = Concert.find(params[:id])
  end

  private

  def concert_params
    params.require(:concert).permit(:title, :venue, :date)
  end
end
