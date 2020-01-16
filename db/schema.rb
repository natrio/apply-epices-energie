# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_16_155236) do

  create_table "daily_power_records", force: :cascade do |t|
    t.date "date"
    t.float "energy"
    t.integer "power_station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["power_station_id"], name: "index_daily_power_records_on_power_station_id"
  end

  create_table "power_stations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "energy_total"
  end

  create_table "solar_inverter_records", force: :cascade do |t|
    t.string "ref"
    t.datetime "datetime"
    t.float "energy"
    t.integer "power_station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.index ["power_station_id"], name: "index_solar_inverter_records_on_power_station_id"
  end

  add_foreign_key "daily_power_records", "power_stations"
  add_foreign_key "solar_inverter_records", "power_stations"
end
