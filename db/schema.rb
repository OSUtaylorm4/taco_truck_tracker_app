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

ActiveRecord::Schema.define(version: 20160424184909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "company"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "image"
    t.string   "website"
    t.string   "phone"
    t.string   "menu1"
    t.string   "menu2"
    t.boolean  "status",               default: false
    t.string   "sun_open"
    t.string   "sun_close"
    t.string   "mon_open"
    t.string   "mon_close"
    t.string   "tues_open"
    t.string   "tues_close"
    t.string   "weds_open"
    t.string   "weds_close"
    t.string   "thurs_open"
    t.string   "thurs_close"
    t.string   "fri_open"
    t.string   "fri_close"
    t.string   "sat_open"
    t.string   "sat_close"
    t.string   "sun_loc"
    t.string   "mon_loc"
    t.string   "tues_loc"
    t.string   "weds_loc"
    t.string   "thurs_loc"
    t.string   "fri_loc"
    t.string   "sat_loc"
    t.string   "authentication_token"
  end

  add_index "vendors", ["email"], name: "index_vendors_on_email", unique: true, using: :btree

end
