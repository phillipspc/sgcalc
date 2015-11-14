class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :strokes, :distance_out, :start_distance
    rename_column :strokes, :lie, :surface
  end
end
