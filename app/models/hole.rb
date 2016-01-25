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
  has_many :strokes, -> { order("number ASC") }, dependent: :destroy
  accepts_nested_attributes_for :strokes, allow_destroy: true

  validates_presence_of :number
  before_validation :fix_stroke_numbers
  after_save :fix_stroke_numbers

  def incomplete?
    strokes.count == 0
  end

  def total_sg
    strokes.inject(0) {|sum, s| sum + s.strokes_gained}
  end

  def next_number
    return 1 unless strokes.count > 0
    strokes.last.number + 1
  end

  def fix_stroke_numbers
    strokes.each_with_index do |stroke, idx|
      stroke.number = idx + 1
      begin
        stroke.save!
      rescue
        unless errors[:base].include?("Invalid stroke")
          errors[:base] << "Invalid stroke"
        end
      end
    end
  end

  def previous
    self == round.holes.first ? round.holes.last : round.holes[number - 2]
  end

  def next
    self == round.holes.last ? round.holes.first : round.holes[number]
  end
end
