class StrokesController < ApplicationController
  def new
    @hole = Hole.find(params[:hole_id])
    @stroke = @hole.new_stroke
  end

  def create
    @hole = Hole.find(params[:hole_id])
    @stroke = Stroke.new(stroke_params)
    if @stroke.save
      redirect_to hole_path(@hole)
    else
      render 'new'
    end
  end

  private
  def stroke_params
    params.require(:stroke).permit(:id, :hole_id, :number, :start_distance, :surface, :penalty)
  end

end
