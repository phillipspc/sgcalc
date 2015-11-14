# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151114193112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "holes", force: :cascade do |t|
    t.integer  "round_id",   null: false
    t.integer  "number",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "holes", ["number"], name: "index_holes_on_number", using: :btree
  add_index "holes", ["round_id"], name: "index_holes_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.date     "date_played"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course"
    t.text     "notes"
  end

  add_index "rounds", ["course"], name: "index_rounds_on_course", using: :btree
  add_index "rounds", ["date_played"], name: "index_rounds_on_date_played", using: :btree

  create_table "strokes", force: :cascade do |t|
    t.integer  "hole_id",        null: false
    t.integer  "start_distance", null: false
    t.string   "surface",        null: false
    t.integer  "number",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "strokes", ["hole_id"], name: "index_strokes_on_hole_id", using: :btree
  add_index "strokes", ["number"], name: "index_strokes_on_number", using: :btree
  add_index "strokes", ["start_distance"], name: "index_strokes_on_start_distance", using: :btree
  add_index "strokes", ["surface"], name: "index_strokes_on_surface", using: :btree

end
