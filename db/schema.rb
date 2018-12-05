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

ActiveRecord::Schema.define(version: 2018_12_02_075318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.integer "apartment_number"
    t.bigint "condo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condo_id"], name: "index_apartments_on_condo_id"
  end

  create_table "condos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fees", force: :cascade do |t|
    t.integer "amount"
    t.datetime "date"
    t.bigint "apartment_id"
    t.bigint "user_id"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_fees_on_apartment_id"
    t.index ["user_id"], name: "index_fees_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "role"
    t.bigint "apartment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_users_on_apartment_id"
  end

  add_foreign_key "apartments", "condos"
  add_foreign_key "fees", "apartments"
  add_foreign_key "fees", "users"
  add_foreign_key "users", "apartments"
end