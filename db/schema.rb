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

ActiveRecord::Schema.define(version: 20150228200217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivercommutes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "car_type"
    t.point    "origin"
    t.string   "origin_name"
    t.point    "destination"
    t.string   "destination_name"
    t.time     "arrival_time"
    t.text     "days",             default: [], array: true
    t.json     "user_info"
    t.integer  "seats_available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drivercommutes", ["user_id"], name: "index_drivercommutes_on_user_id", using: :btree

  create_table "passengercommutes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "drivercommute_id"
    t.point    "origin"
    t.string   "origin_name"
    t.point    "destination"
    t.string   "destination_name"
    t.time     "arrival_time"
    t.text     "days",             default: [], array: true
    t.json     "user_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passengercommutes", ["drivercommute_id"], name: "index_passengercommutes_on_drivercommute_id", using: :btree
  add_index "passengercommutes", ["user_id"], name: "index_passengercommutes_on_user_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "cross_street"
    t.point    "cross_street_point"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["user_id"], name: "index_places_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "drivercommute_id"
    t.integer  "passengercommute_id"
    t.datetime "approved_at"
    t.datetime "rejected_at"
    t.integer  "initiated_by_id"
    t.integer  "approved_by_id"
    t.boolean  "initiated_by_driver"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["drivercommute_id"], name: "index_requests_on_drivercommute_id", using: :btree
  add_index "requests", ["passengercommute_id"], name: "index_requests_on_passengercommute_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "drivercommute_id"
    t.integer  "passengercommute_id"
    t.integer  "reviewee_id"
    t.integer  "reviewer_id"
    t.integer  "rating"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["drivercommute_id"], name: "index_reviews_on_drivercommute_id", using: :btree
  add_index "reviews", ["passengercommute_id"], name: "index_reviews_on_passengercommute_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "linkedin"
    t.float    "rating"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "industry"
  end

end
