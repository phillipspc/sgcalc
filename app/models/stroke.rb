# == Schema Information
#
# Table name: strokes
#
#  id             :integer          not null, primary key
#  hole_id        :integer          not null
#  start_distance :integer          not null
#  surface        :string           not null
#  number         :integer          not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Stroke < ActiveRecord::Base
  belongs_to :hole
  has_one :round, through: :hole

  validates_presence_of :start_distance, :surface, :number
  validates_inclusion_of :surface, in: ['Tee', 'Fairway', 'Rough', 'Sands', 'Recovery', 'Green']
end
