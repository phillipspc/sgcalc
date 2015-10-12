class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :round_id, null: false
      t.integer :number, null: false
      t.timestamps
    end
    add_index :holes, :round_id
    add_index :holes, :number
  end
end
