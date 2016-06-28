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

ActiveRecord::Schema.define(version: 20160626131738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "input_products", force: :cascade do |t|
    t.integer  "input_id"
    t.integer  "product_id"
    t.decimal  "price"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "input_products", ["input_id"], name: "index_input_products_on_input_id", using: :btree
  add_index "input_products", ["product_id"], name: "index_input_products_on_product_id", using: :btree

  create_table "inputs", force: :cascade do |t|
    t.date     "date_input"
    t.text     "description"
    t.integer  "member_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "inputs", ["member_id"], name: "index_inputs_on_member_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "phone"
    t.string   "street",         limit: 60
    t.string   "number_address", limit: 6
    t.string   "neighborhood",   limit: 20
    t.string   "city",           limit: 30
    t.integer  "state"
    t.integer  "gender"
    t.string   "zipcode"
    t.string   "email",          limit: 80
    t.string   "cell_phone",     limit: 20
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "output_products", force: :cascade do |t|
    t.integer  "output_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "output_products", ["output_id"], name: "index_output_products_on_output_id", using: :btree
  add_index "output_products", ["product_id"], name: "index_output_products_on_product_id", using: :btree

  create_table "outputs", force: :cascade do |t|
    t.date     "date_output"
    t.text     "description"
    t.integer  "member_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "outputs", ["member_id"], name: "index_outputs_on_member_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "phone"
    t.string   "street",         limit: 60
    t.string   "number_address", limit: 6
    t.string   "neighborhood",   limit: 20
    t.string   "city",           limit: 30
    t.integer  "state"
    t.integer  "gender"
    t.string   "zipcode"
    t.string   "email",          limit: 80
    t.string   "cell_phone",     limit: 20
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "job"
    t.date     "date_input"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "minimum_stock"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stocks", ["product_id"], name: "index_stocks_on_product_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "input_products", "inputs"
  add_foreign_key "input_products", "products"
  add_foreign_key "inputs", "members"
  add_foreign_key "output_products", "outputs"
  add_foreign_key "output_products", "products"
  add_foreign_key "outputs", "members"
  add_foreign_key "stocks", "products"
end
