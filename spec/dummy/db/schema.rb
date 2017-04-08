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

ActiveRecord::Schema.define(version: 20170406184222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purchaser_addresses", force: :cascade do |t|
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.integer  "country_id"
    t.string   "city"
    t.string   "zip"
    t.string   "phone"
    t.string   "type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["addressable_type", "addressable_id"], name: "index_purchaser_adrs_on_adrsable_type_and_adrsable_id", using: :btree
    t.index ["country_id"], name: "index_purchaser_addresses_on_country_id", using: :btree
  end

  create_table "purchaser_countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchaser_coupons", force: :cascade do |t|
    t.integer  "discount"
    t.string   "code"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_purchaser_coupons_on_code", using: :btree
    t.index ["order_id"], name: "index_purchaser_coupons_on_order_id", using: :btree
  end

  create_table "purchaser_credit_cards", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "number"
    t.string   "name"
    t.string   "cvv"
    t.integer  "expiry_month"
    t.integer  "expiry_year"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["order_id"], name: "index_purchaser_credit_cards_on_order_id", using: :btree
  end

  create_table "purchaser_deliveries", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 10, scale: 2
    t.integer  "min_days"
    t.integer  "max_days"
    t.integer  "country_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["country_id"], name: "index_purchaser_deliveries_on_country_id", using: :btree
  end

  create_table "purchaser_line_items", force: :cascade do |t|
    t.integer  "quantity",                           default: 1
    t.decimal  "price",      precision: 8, scale: 2
    t.integer  "order_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["order_id"], name: "index_purchaser_line_items_on_order_id", using: :btree
  end

  create_table "purchaser_orders", force: :cascade do |t|
    t.string   "state"
    t.integer  "user_id"
    t.decimal  "total_price", precision: 10, scale: 2
    t.integer  "delivery_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["delivery_id"], name: "index_purchaser_orders_on_delivery_id", using: :btree
  end

end
