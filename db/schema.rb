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

ActiveRecord::Schema.define(version: 2019_12_03_172512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.text "motivation"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_datetime"
    t.integer "duration"
    t.text "description"
    t.string "short_location"
    t.string "adress"
    t.string "zip_code"
    t.string "city"
    t.bigint "startup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["startup_id"], name: "index_events_on_startup_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "startups", force: :cascade do |t|
    t.string "name"
    t.text "catch_phrase"
    t.string "website_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "situation_id"
    t.text "formation"
    t.bigint "activity_id"
    t.text "description"
    t.text "linked_in_url"
    t.bigint "newsletter_id"
    t.index ["activity_id"], name: "index_users_on_activity_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["newsletter_id"], name: "index_users_on_newsletter_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["situation_id"], name: "index_users_on_situation_id"
  end

  add_foreign_key "users", "activities"
  add_foreign_key "users", "newsletters"
  add_foreign_key "users", "situations"
end
