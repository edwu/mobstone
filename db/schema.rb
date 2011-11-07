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

ActiveRecord::Schema.define(:version => 20111106233318) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.integer  "company_id"
    t.integer  "min_price"
    t.string   "description"
    t.integer  "org_price"
    t.boolean  "expired",     :default => false
    t.datetime "startdate"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "category",    :default => "other"
  end

  create_table "milestones", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "price"
    t.integer  "people"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "credits",            :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.boolean  "is_company",         :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "vouchers", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "user_id"
    t.string   "value"
    t.boolean  "redeemed",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
