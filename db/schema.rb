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

ActiveRecord::Schema[7.0].define(version: 2022_10_16_063825) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighbourhoods", force: :cascade do |t|
    t.string "name"
    t.integer "ward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_neighbourhoods_on_ward_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "neighbourhood_id", null: false
    t.string "latitude"
    t.string "longitude"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighbourhood_id"], name: "index_requests_on_neighbourhood_id"
    t.index ["service_id"], name: "index_requests_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_request"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_services_on_category_id"
  end

  create_table "wards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "neighbourhoods", "wards"
  add_foreign_key "requests", "neighbourhoods"
  add_foreign_key "requests", "services"
  add_foreign_key "services", "categories"
end
