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

ActiveRecord::Schema.define(version: 20220317004953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "document_topic_sub_topics", force: :cascade do |t|
    t.integer  "document_topic_id"
    t.string   "number"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "document_topic_sub_topics", ["document_topic_id"], name: "index_document_topic_sub_topics_on_document_topic_id", using: :btree

  create_table "document_topics", force: :cascade do |t|
    t.integer  "document_id"
    t.string   "number"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "document_topics", ["document_id"], name: "index_document_topics_on_document_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.integer  "type_document"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "event_patients", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "patient_id"
    t.integer  "status_event_patient"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "event_patients", ["event_id"], name: "index_event_patients_on_event_id", using: :btree
  add_index "event_patients", ["patient_id"], name: "index_event_patients_on_patient_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "status_event"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "quant_patients"
  end

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
    t.boolean  "closed"
  end

  add_index "inputs", ["member_id"], name: "index_inputs_on_member_id", using: :btree

  create_table "member_saints", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "line"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "member_saints", ["member_id"], name: "index_member_saints_on_member_id", using: :btree

  create_table "member_scales", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "scale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "member_scales", ["member_id"], name: "index_member_scales_on_member_id", using: :btree
  add_index "member_scales", ["scale_id"], name: "index_member_scales_on_scale_id", using: :btree

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
    t.string   "position"
    t.integer  "type_member"
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
    t.string   "street",         limit: 255
    t.string   "number_address", limit: 255
    t.string   "neighborhood",   limit: 255
    t.string   "city",           limit: 255
    t.integer  "state"
    t.integer  "gender"
    t.string   "zipcode"
    t.string   "email",          limit: 80
    t.string   "cell_phone",     limit: 20
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
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

  create_table "reminders", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "color_title"
    t.integer  "color_subtitle"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "video"
  end

  create_table "scales", force: :cascade do |t|
    t.date     "date"
    t.integer  "type_scale"
    t.text     "description"
    t.time     "hours"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stocks", ["product_id"], name: "index_stocks_on_product_id", using: :btree

  create_table "studies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "study_page_topics", force: :cascade do |t|
    t.integer  "study_page_id"
    t.string   "number"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "study_page_topics", ["study_page_id"], name: "index_study_page_topics_on_study_page_id", using: :btree

  create_table "study_pages", force: :cascade do |t|
    t.integer  "study_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "video"
    t.string   "image"
  end

  add_index "study_pages", ["study_id"], name: "index_study_pages_on_study_id", using: :btree

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

  add_foreign_key "document_topic_sub_topics", "document_topics"
  add_foreign_key "document_topics", "documents"
  add_foreign_key "event_patients", "events"
  add_foreign_key "event_patients", "patients"
  add_foreign_key "input_products", "inputs"
  add_foreign_key "input_products", "products"
  add_foreign_key "inputs", "members"
  add_foreign_key "member_saints", "members"
  add_foreign_key "member_scales", "members"
  add_foreign_key "member_scales", "scales"
  add_foreign_key "output_products", "outputs"
  add_foreign_key "output_products", "products"
  add_foreign_key "outputs", "members"
  add_foreign_key "stocks", "products"
  add_foreign_key "study_page_topics", "study_pages"
  add_foreign_key "study_pages", "studies"
end
