# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_11_30_152655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone", default: [], null: false, array: true
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_guests_on_email", unique: true
    t.index ["phone"], name: "index_guests_on_phone", unique: true
  end

  create_table "reservation_guests", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_reservation_guests_on_guest_id"
    t.index ["reservation_id", "guest_id"], name: "index_reservation_guests_on_reservation_id_and_guest_id", unique: true
    t.index ["reservation_id"], name: "index_reservation_guests_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "no_of_nights", default: 0, null: false
    t.integer "no_of_guests", default: 0, null: false
    t.integer "adults", default: 0, null: false
    t.integer "infants", default: 0, null: false
    t.integer "children", default: 0, null: false
    t.string "status"
    t.string "currency"
    t.decimal "payout_price", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "security_price", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total_price", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservation_guests", "guests"
  add_foreign_key "reservation_guests", "reservations"
end
