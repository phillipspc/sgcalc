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
      get_par_num = rand(0..2)
      get_extra_stroke = rand(0..2)

      if get_par_num == 0
        # Generates strokes for a par 3
        if get_extra_stroke == 0
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(150..250), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'}
            ])
        elsif get_extra_stroke == 1
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(150..250), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'},
            {number: 3, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'}
            ])
        else
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(150..250), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'},
            {number: 3, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'},
            {number: 4, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'}
            ])
        end
      elsif get_par_num == 1
        # Generates strokes for a par 4
        if get_extra_stroke == 0
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(300..450), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(50..150), surface: 'Fairway'},
            {number: 3, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'}
            ])
        elsif get_extra_stroke == 1
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(300..450), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(50..150), surface: 'Fairway'},
            {number: 3, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'},
            {number: 4, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'}
            ])
        else
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(300..450), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(50..150), surface: 'Fairway'},
            {number: 3, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'},
            {number: 4, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'},
            {number: 5, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'}
            ])
        end
      elsif get_par_num == 2
        # Generates strokes for a par 5
        if get_extra_stroke == 0
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(450..600), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(200..400), surface: 'Fairway'},
            {number: 3, hole_id: hole.id, start_distance: rand(50..150), surface: 'Fairway'},
            {number: 4, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'}
            ])
        elsif get_extra_stroke == 1
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(450..600), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(200..400), surface: 'Fairway'},
            {number: 3, hole_id: hole.id, start_distance: rand(50..150), surface: 'Fairway'},
            {number: 4, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'},
            {number: 5, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'}
            ])
        else
          Stroke.create([
            {number: 1, hole_id: hole.id, start_distance: rand(450..600), surface: 'Tee'},
            {number: 2, hole_id: hole.id, start_distance: rand(200..400), surface: 'Fairway'},
            {number: 3, hole_id: hole.id, start_distance: rand(50..150), surface: 'Fairway'},
            {number: 4, hole_id: hole.id, start_distance: rand(5..20), surface: 'Green'},
            {number: 5, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'},
            {number: 6, hole_id: hole.id, start_distance: rand(1..4), surface: 'Green'}
            ])
        end
      end

    end
  end
