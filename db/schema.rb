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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130201100531) do

  create_table "addresses", :force => true do |t|
    t.string   "address"
    t.integer  "person_id"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cfos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offices", :force => true do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "ancestry"
    t.string   "type_of_children"
    t.string   "address"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.integer  "organization_id"
    t.string   "birth_date"
    t.integer  "cfo_id"
    t.string   "fb_profile"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "people_offices", :force => true do |t|
    t.integer  "person_id"
    t.integer  "office_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "phone_number"
    t.integer  "person_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
