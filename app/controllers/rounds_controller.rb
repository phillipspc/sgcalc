class RoundsController < ApplicationController
  before_action :find_round, only: [:show, :edit, :update, :destroy]

  def index
    @rounds = Round.all
  end

  def show
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      redirect_to rounds_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def round_params
    params.require(:round).permit(:id, :date_played, :course, :notes, holes_attributes: [:id, :round_id, :number, strokes_attributes: [:id, :hole_id, :distance_out, :lie, :number]])
  end

  def find_round
    @round = Round.find(params[:id])
  end

end
