# == Schema Information
#
# Table name: strokes
#
#  id           :integer          not null, primary key
#  hole_id      :integer          not null
#  distance_out :integer          not null
#  lie          :string           not null
#  number       :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Stroke < ActiveRecord::Base
  belongs_to :hole
end
