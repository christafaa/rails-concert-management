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
    @piece = Piece.find_by(id: params[:id])
  end

  def update
    @piece = Piece.find_by(id: params[:id]).update(piece_params)

    if @piece
      redirect_to concert_path(@piece.concert)
    else
      render :edit
    end
  end

  def show
    @piece = Piece.find_by(id: params[:id])
  end

  def index
    @concert = Concert.find_by(id: params[:concert_id])
    @pieces = @concert.pieces
  end

  def destroy
    Piece.find_by(id: params[:id]).destroy
    concert = Concert.find_by(id: params[:concert_id])
    redirect_to concert_pieces_path(concert)
  end

  private

  def piece_params
    params.require(:piece).permit(:title, :composer, :date_composed)
  end
end
