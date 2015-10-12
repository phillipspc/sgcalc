# == Schema Information
#
# Table name: rounds
#
#  id          :integer          not null, primary key
#  date_played :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Round < ActiveRecord::Base
  has_many :holes
end
