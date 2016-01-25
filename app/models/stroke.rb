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
#  penalty        :integer
#

class Stroke < ActiveRecord::Base
  belongs_to :hole
  has_one :round, through: :hole

  validates_presence_of :start_distance, :surface, :number
  validates_inclusion_of :surface, in: ['Tee', 'Fairway', 'Rough', 'Sand', 'Recovery', 'Green']
  validate :data_available

  def pro_strokes
    return nil unless start_distance && surface
    surfaces = {'Tee' => 'T', 'Fairway' => 'F', 'Rough' => 'R', 'Sand' => 'S', 'Recovery' => 'X', 'Green' => 'G'}
    compiled = surfaces[surface] + "-" + start_distance.to_s
    Sgcalc::SGDATA[compiled]
  end

  def strokes_gained
    return nil unless start_distance && surface
    sg = pro_strokes - 1
    sg -= 1 if penalty.present?
    sg -= next_stroke.pro_strokes unless last?
    return sg
  end

  def last?
    self == hole.strokes.last
  end

  def next_stroke
    return nil if last?
    hole.strokes.where("number = ? + 1", number).first
  end

  def data_available
    if pro_strokes == 0 || pro_strokes == nil
      case surface
      when 'Tee'
        errors.add(:start_distance) << "must be between 100 and 600 yards for a Tee shot"
      when 'Fairway'
        errors.add(:start_distance) << "must be between 10 and 600 yards for a Fairway shot"
      when 'Rough'
        errors.add(:start_distance) << "must be between 10 and 600 yards for a shot from Rough"
      when 'Sand'
        errors.add(:start_distance) << "must be between 10 and 600 yards for a shot from Sand"
      when 'Recovery'
        errors.add(:start_distance) << "must be between 81 and 600 yards for a Recovery shot"
      when 'Green'
        errors.add(:start_distance) << "must be between 1 and 115 feet for a putt"
      end
    end
  end
end
