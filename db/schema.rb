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

ActiveRecord::Schema.define(version: 20160422002133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "carts", ["item_id"], name: "index_carts_on_item_id", using: :btree
  add_index "carts", ["order_id"], name: "index_carts_on_order_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",               default: 0
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "subject",    limit: 255
    t.string   "email",      limit: 255
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distributors", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "address",    limit: 255, null: false
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friend_pages", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.string   "url",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title",                 limit: 255
    t.string   "subtitle",              limit: 255
    t.string   "year",                  limit: 255
    t.string   "format",                limit: 255
    t.integer  "pages"
    t.string   "author",                limit: 255
    t.string   "isbn",                  limit: 255
    t.float    "price"
    t.text     "description"
    t.string   "index_file_name",       limit: 255
    t.string   "index_content_type",    limit: 255
    t.integer  "index_file_size"
    t.datetime "index_updated_at"
    t.string   "image_file_name",       limit: 255
    t.string   "image_content_type",    limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new"
    t.integer  "order"
    t.decimal  "weight"
    t.boolean  "has_stock",                         default: true
    t.string   "fulltext_file_name"
    t.string   "fulltext_content_type"
    t.integer  "fulltext_file_size"
    t.datetime "fulltext_updated_at"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "payment"
    t.boolean  "shipping"
    t.text     "observations"
    t.string   "mpid",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shipping_address_id"
    t.decimal  "shipping_cost"
    t.boolean  "digital"
    t.string   "url"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "rails_admin_histories", force: :cascade do |t|
    t.text     "message"
    t.string   "username",   limit: 255
    t.integer  "item"
    t.string   "table",      limit: 255
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "title",             limit: 255, null: false
    t.string   "text_file_name",    limit: 255
    t.string   "text_content_type", limit: 255
    t.integer  "text_file_size"
    t.datetime "text_updated_at"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.text     "address"
    t.string   "postal_code", limit: 255
    t.string   "city",        limit: 255
    t.integer  "user_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_costs", force: :cascade do |t|
    t.decimal  "cost",       null: false
    t.decimal  "weight",     null: false
    t.integer  "state_id"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",               default: 0
  end

  create_table "texts", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.text     "text",                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
    t.date     "birthdate"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.boolean  "admin"
  end

  add_index "users", ["country_id"], name: "index_users_on_country_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["state_id"], name: "index_users_on_state_id", using: :btree

end
