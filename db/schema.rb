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

ActiveRecord::Schema.define(version: 20160130190919) do

  create_table "images", force: :cascade do |t|
    t.string   "url"
    t.integer  "trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trail_id"], name: "index_images_on_trail_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "lat_long_coords"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "state"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "tags_trails", id: false, force: :cascade do |t|
    t.integer "tag_id",   null: false
    t.integer "trail_id", null: false
    t.index ["tag_id", "trail_id"], name: "index_tags_trails_on_tag_id_and_trail_id"
    t.index ["trail_id", "tag_id"], name: "index_tags_trails_on_trail_id_and_tag_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "location_id"
    t.text     "route"
    t.string   "gpx_file_path"
    t.integer  "author_id"
    t.index ["author_id"], name: "index_trails_on_author_id"
    t.index ["location_id"], name: "index_trails_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
