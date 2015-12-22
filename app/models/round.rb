# == Schema Information
#
# Table name: rounds
#
#  id          :integer          not null, primary key
#  date_played :date
#  created_at  :datetime
#  updated_at  :datetime
#  course      :string
#  notes       :text
#

class Round < ActiveRecord::Base
  has_many :holes, -> { order("number ASC") }
  has_many :strokes, through: :holes

  accepts_nested_attributes_for :holes

  after_create :add_holes

  def add_holes
    18.times do |i|
      hole = Hole.new(number: i+1, round_id: id)
      hole.save!
    end
  end

  def next_hole
    holes.each do |hole|
      if hole.strokes.count == 0
        return hole
      else
        next
      end
    end
  end

  def incomplete?
    holes.any? {|hole| hole.incomplete?}
  end

  def total_sg
    "N/A" if incomplete?
  end

  def status
    incomplete? ? "incomplete" : "complete"
  end
end
