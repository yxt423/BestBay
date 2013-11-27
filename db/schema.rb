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

ActiveRecord::Schema.define(:version => 20131127205538) do

  create_table "bids", :force => true do |t|
    t.float    "bid_price"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "quantity"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "creditcards", :force => true do |t|
    t.string   "credit_card_no"
    t.integer  "expiry_month"
    t.integer  "expiry_year"
    t.string   "security_code"
    t.boolean  "primary_credit_card"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "image_1"
    t.string   "image_2"
    t.string   "image_3"
    t.float    "base_price"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "quantity"
    t.boolean  "deactivated",      :default => false
    t.integer  "category_id"
    t.integer  "view_count"
    t.boolean  "for_auction",      :default => false
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.string   "message_text"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "buyer_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.integer  "price"
    t.integer  "cost"
    t.string   "shipping_address"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.string   "phone_no"
    t.string   "credit_card_no"
    t.boolean  "is_seller"
    t.string   "profile_pic"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "remember_token"
    t.integer  "expiry_month"
    t.integer  "expiry_year"
    t.integer  "security_code"
    t.string   "shipping_address"
    t.boolean  "is_admin"
    t.boolean  "deactivated",      :default => false
    t.string   "activation_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
