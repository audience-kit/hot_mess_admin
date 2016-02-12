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

ActiveRecord::Schema.define(version: 20160210111558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "events", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name",         null: false
    t.string   "display_name", null: false
    t.uuid     "venue_id"
    t.index ["venue_id"], name: "index_events_on_venue_id", using: :btree
  end

  create_table "locales", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name",                 null: false
    t.string   "display_name",         null: false
    t.string   "google_place_id"
    t.string   "facebook_location_id"
    t.index ["name"], name: "index_locales_on_name", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "display_name",                           null: false
    t.string   "facebook_token"
    t.string   "facebook_refresh_token"
    t.boolean  "is_admin",               default: false, null: false
  end

  create_table "venues", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name",              null: false
    t.string   "display_name",      null: false
    t.string   "google_pace_id"
    t.string   "facebook_place_id"
    t.uuid     "locale_id"
    t.index ["locale_id"], name: "index_venues_on_locale_id", using: :btree
  end

  add_foreign_key "events", "venues"
  add_foreign_key "venues", "locales"
end
