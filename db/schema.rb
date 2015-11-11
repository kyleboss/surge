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

ActiveRecord::Schema.define(version: 20151111013313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "country"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "number"
    t.integer  "cvv"
    t.integer  "address_id"
    t.date     "expiration_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "credit_cards", ["address_id"], name: "index_credit_cards_on_address_id", using: :btree

  create_table "drugs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.integer  "address_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hospitals", ["address_id"], name: "index_hospitals_on_address_id", using: :btree
  add_index "hospitals", ["user_id"], name: "index_hospitals_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "hospital_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["hospital_id"], name: "index_locations_on_hospital_id", using: :btree

  create_table "pills", force: :cascade do |t|
    t.integer  "drug_id"
    t.integer  "brand_id"
    t.integer  "location_id"
    t.integer  "hospital_id"
    t.integer  "qty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pills", ["brand_id"], name: "index_pills_on_brand_id", using: :btree
  add_index "pills", ["drug_id"], name: "index_pills_on_drug_id", using: :btree
  add_index "pills", ["hospital_id"], name: "index_pills_on_hospital_id", using: :btree
  add_index "pills", ["location_id"], name: "index_pills_on_location_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.integer  "address_id"
    t.string   "email"
    t.string   "password"
    t.integer  "credit_card_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id", using: :btree
  add_index "users", ["credit_card_id"], name: "index_users_on_credit_card_id", using: :btree

  add_foreign_key "credit_cards", "addresses"
  add_foreign_key "hospitals", "addresses"
  add_foreign_key "hospitals", "users"
  add_foreign_key "locations", "hospitals"
  add_foreign_key "pills", "brands"
  add_foreign_key "pills", "drugs"
  add_foreign_key "pills", "hospitals"
  add_foreign_key "pills", "locations"
  add_foreign_key "users", "addresses"
  add_foreign_key "users", "credit_cards"
end
