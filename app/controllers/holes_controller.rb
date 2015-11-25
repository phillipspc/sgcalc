class HolesController < ApplicationController
  before_action :find_hole, only: [:show, :edit, :update, :destroy]
  def index
    @holes = Hole.all
  end

  def show
  end

  def new
    # @hole = Hole.new
    # @hole.strokes.build
  end

  def create
    # @hole = Hole.new(hole_params)
    # if @hole.save
    #   redirect_to @hole
    # else
    #   render 'new'
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def hole_params
    params.require(:hole).permit(:id, :round_id, :number, strokes_attributes: [:id, :hole_id, :distance_out, :lie, :number])
  end

  def find_hole
    @hole = Hole.find(params[:id])
  end
end
