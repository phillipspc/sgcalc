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
  has_many :holes, -> { order("number ASC") }, dependent: :destroy
  has_many :strokes, through: :holes

  accepts_nested_attributes_for :holes

  after_create :add_holes

  def incomplete?
    holes.any? {|hole| hole.incomplete?}
  end

  def total_sg
    return "N/A" if incomplete?
    holes.inject(0) { |sum, h| sum + h.total_sg }.round(3)
  end

  def status
    incomplete? ? "incomplete" : "complete"
  end

  def tee_shot_sg
    tee_shots = strokes.where("surface = 'Tee' AND start_distance >= 270")
    return "N/A" if tee_shots.empty?
    tee_shots.inject(0) {|sum, s| sum + s.strokes_gained}.round(3)
  end

  def approach_shot_sg
    approach_shots = strokes.where("surface != 'Tee' AND start_distance >= 100")
    return "N/A" if approach_shots.empty?
    approach_shots.inject(0) {|sum, s| sum + s.strokes_gained}.round(3)
  end

  def short_game_sg
    short_game_shots = strokes.where("surface != 'Green' AND start_distance <= 100")
    return "N/A" if short_game_shots.empty?
    short_game_shots.inject(0) {|sum, s| sum + s.strokes_gained}.round(3)
  end

  def putting_sg
    putts = strokes.where("surface = 'Green'")
    return "N/A" if putts.empty?
    putts.inject(0) {|sum, s| sum + s.strokes_gained}.round(3)
  end

  private

  def add_holes
    18.times do |i|
      hole = Hole.new(number: i+1, round_id: id)
      hole.save!
    end
  end

end
