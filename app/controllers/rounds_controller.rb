class RoundsController < ApplicationController
  before_action :find_round, only: [:show, :edit, :update, :destroy]

  def index
    @rounds = Round.all.includes(:holes).includes(:strokes)
  end

  def show
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      redirect_to round_path(@round)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @round.destroy
      redirect_to rounds_path
    else
      flash[:error] = @round.errors.full_messages.join(', ')
    end
  end

  private
  def round_params
    params.require(:round).permit(:id, :date_played, :course, :notes)
  end

  def find_round
    @round = Round.find(params[:id])
    @holes = @round.holes.includes(:strokes)
  end

end
