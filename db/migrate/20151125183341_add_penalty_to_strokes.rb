class AddPenaltyToStrokes < ActiveRecord::Migration
  def change
    add_column :strokes, :penalty, :integer
  end
end
