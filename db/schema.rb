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

ActiveRecord::Schema.define(version: 20160823101004) do

  create_table "cars", force: :cascade do |t|
    t.string   "brand",        limit: 255
    t.string   "model",        limit: 255
    t.string   "license_plat", limit: 255
    t.decimal  "fare",                     precision: 8
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "car_id",     limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "orders", ["car_id"], name: "index_orders_on_car_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "address",    limit: 65535
    t.string   "mobile",     limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "orders", "cars"
  add_foreign_key "orders", "users"
end
