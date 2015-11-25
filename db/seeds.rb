# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  rounds = Round.create([
    {date_played: Date.today - 1.day, course: 'Broad Bay', notes: 'Played with Dad'},
    {date_played: Date.today - 2.days, course: "Owl's Creek", notes: 'Nice day'},
    {date_played: Date.today - 3.days, course: 'Cavalier', notes: 'Good round!'}])

  rounds.each do |round|
    round.holes.each do |hole|
      strokes = Stroke.create([
        {number: 1, hole_id: hole.id, start_distance: rand(300..400), surface: 'Tee'},
        {number: 2, hole_id: hole.id, start_distance: rand(50..150), surface: 'Fairway'},
        {number: 3, hole_id: hole.id, start_distance: rand(1..20), surface: 'Green'}])
    end
  end
