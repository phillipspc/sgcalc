# == Schema Information
#
# Table name: holes
#
#  id         :integer          not null, primary key
#  round_id   :integer          not null
#  number     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Hole < ActiveRecord::Base
  belongs_to :round
  has_many :strokes, -> { order("number ASC") }
  accepts_nested_attributes_for :strokes

  validates_presence_of :number

  def incomplete?
    strokes.count == 0
  end

  def hole_total_sg
    total = 0
    strokes.each {|stroke| total += stroke.strokes_gained}
    total
  end

  def potential_strokes
    strokes = []
    ((self.strokes.last.number + 1)..10).step do |num|
      strokes << Stroke.new(number: num, hole_id: id)
    end
    strokes
  end

  def new_stroke
    if strokes.empty?
      Stroke.new({hole_id: id, number: 1})
    else
      new_number = strokes.last.number + 1
      Stroke.new({hole_id: id, number: new_number})
    end
  end
end
