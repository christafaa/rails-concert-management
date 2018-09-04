class PiecesController < ApplicationController
  def new
    @piece = Piece.new
  end

  def create
    @concert = Concert.find_by(id: params[:concert_id])
    @concert.pieces.build(piece_params)

    if @concert.save
      redirect_to concert_path(@concert)
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

  end

  def destroy

  end

  private

  def piece_params
    params.require(:piece).permit(:title, :composer, :date_composed)
  end
end
