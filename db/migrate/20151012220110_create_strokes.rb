class CreateStrokes < ActiveRecord::Migration
  def change
    create_table :strokes do |t|
      t.integer :hole_id, null: false
      t.integer :distance_out, null: false
      t.string :lie, null: false
      t.integer :number, null: false
      t.timestamps
    end
    add_index :strokes, :hole_id
    add_index :strokes, :distance_out
    add_index :strokes, :lie
    add_index :strokes, :number
  end
end
