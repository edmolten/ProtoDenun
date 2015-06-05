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

ActiveRecord::Schema.define(version: 20150605172118) do

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "denun_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "likes",      default: 0
    t.integer  "dislikes",   default: 0
  end

  create_table "denun_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "denuns", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "like",          default: 1
    t.integer  "dislike",       default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hidden",        default: false
    t.integer  "denun_type_id"
  end

end
