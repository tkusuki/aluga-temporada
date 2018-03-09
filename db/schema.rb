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

ActiveRecord::Schema.define(version: 20180309175119) do

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.integer "maximum_guests"
    t.integer "minimum_rent"
    t.integer "maximum_rent"
    t.decimal "daily_rate"
    t.string "rent_purpose"
    t.string "property_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "main_photo"
    t.text "description"
    t.string "neighborhood"
    t.integer "rooms"
    t.boolean "accessibility"
    t.boolean "allow_pets"
    t.boolean "allow_smokers"
  end

end
