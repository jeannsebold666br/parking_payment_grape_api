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

ActiveRecord::Schema.define(version: 20151025184437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ticket_paids", force: :cascade do |t|
    t.integer  "ticket_id"
    t.float    "price"
    t.date     "paidDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ticket_paids", ["ticket_id"], name: "index_ticket_paids_on_ticket_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree
  add_index "tickets", ["vehicle_id"], name: "index_tickets_on_vehicle_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "identifier"
    t.string   "vehicle_type"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

  add_foreign_key "ticket_paids", "tickets"
  add_foreign_key "tickets", "users"
  add_foreign_key "vehicles", "users"
end
