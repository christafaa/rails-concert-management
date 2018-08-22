class ConcertsController < ApplicationController
  def new
    @concert = Concert.new
  end

  def create

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
end
