class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.date :date_played
      t.timestamps
    end
    add_index :rounds, :date_played
  end
end
