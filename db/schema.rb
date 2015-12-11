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

ActiveRecord::Schema.define(version: 20151211162230) do

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.integer  "trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["trail_id"], name: "index_images_on_trail_id"

  create_table "locations", force: :cascade do |t|
    t.string   "lat_long_coords"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "state"
  end

  create_table "trails", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "location_id"
    t.text     "path"
    t.string   "gpx_file_path"
  end

  add_index "trails", ["location_id"], name: "index_trails_on_location_id"

end
