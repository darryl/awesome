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

ActiveRecord::Schema.define(version: 20130527060225) do

  create_table "importages", force: true do |t|
    t.integer  "mix_id"
    t.integer  "sample_id"
    t.integer  "simple_volume"
    t.float    "start_time",    default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "library_id"
  end

  create_table "libraries", force: true do |t|
    t.integer  "musician_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mixes", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "musician_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musicians", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "musicians", ["email"], name: "index_musicians_on_email", unique: true
  add_index "musicians", ["reset_password_token"], name: "index_musicians_on_reset_password_token", unique: true

  create_table "samples", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "musician_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
  end

end
