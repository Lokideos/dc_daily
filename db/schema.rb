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

ActiveRecord::Schema.define(version: 2019_01_15_100553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_hall_reports", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "general_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["general_report_id"], name: "index_data_hall_reports_on_general_report_id"
  end

  create_table "data_halls", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "data_hall_report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_hall_report_id"], name: "index_data_halls_on_data_hall_report_id"
  end

  create_table "general_reports", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "data_hall_reports", "general_reports"
  add_foreign_key "data_halls", "data_hall_reports"
end
