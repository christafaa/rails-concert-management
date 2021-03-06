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

ActiveRecord::Schema.define(version: 2018_09_04_214600) do

  create_table "attendees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "profession"
    t.integer "age"
    t.integer "wealth_rating"
    t.text "notes"
    t.integer "user_id"
  end

  create_table "concerts", force: :cascade do |t|
    t.string "title"
    t.string "venue"
    t.string "date"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "title"
    t.string "composer"
    t.integer "date_composed"
    t.integer "concert_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "concert_id"
    t.integer "attendee_id"
    t.integer "seat_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "uid"
    t.string "password_digest"
  end

end
