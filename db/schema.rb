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

ActiveRecord::Schema.define(version: 20150106151012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "rooms", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "number_of_toys"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "toy_id"
  end

  add_index "rooms", ["toy_id"], name: "index_rooms_on_toy_id", using: :btree

  create_table "toys", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.decimal  "price",         precision: 10, scale: 2
    t.integer  "available_num"
    t.uuid     "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                                 default: true
  end

  add_index "toys", ["name"], name: "index_toys_on_name", using: :btree

end
