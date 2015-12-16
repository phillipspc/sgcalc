class HolesController < ApplicationController
  before_action :find_hole, only: [:show, :update, :destroy]

  def show
  end

  def update
    if @hole.update(hole_params)
      redirect_to @hole
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def hole_params
    params.require(:hole).permit(:id, :round_id, :number, strokes_attributes: [:id, :hole_id, :start_distance, :surface, :number, :penalty])
  end

  def find_hole
    @hole = Hole.find(params[:id])
  end
end
