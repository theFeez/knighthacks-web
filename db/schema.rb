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

ActiveRecord::Schema.define(version: 20170219084339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.citext   "email"
    t.string   "phone"
    t.string   "shirt_fit_sex"
    t.string   "shirt_fit_size"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "university_name"
    t.string   "major"
    t.citext   "university_email"
    t.string   "expected_graduation"
    t.date     "born_on"
    t.string   "traveling_from_city"
    t.string   "traveling_to_city"
    t.boolean  "travel_accommodations_needed"
    t.string   "number_of_hackathons"
    t.string   "github"
    t.string   "linkedin"
    t.string   "website"
    t.string   "additional_portfolio"
    t.text     "interests"
    t.text     "proud_project"
    t.text     "event_expectations"
    t.text     "additional_remarks"
    t.text     "availability",                 default: [],              array: true
    t.text     "why_mentor"
    t.text     "tech_stack"
    t.string   "gender"
    t.string   "race"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
