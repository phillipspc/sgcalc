class AddCourseAndNotesToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :course, :string
    add_column :rounds, :notes, :text
    add_index :rounds, :course
  end
end
