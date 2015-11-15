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
end
