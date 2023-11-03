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

ActiveRecord::Schema.define(version: 2020_09_12_031803) do

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "var_name"
    t.string "brand_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string "name"
    t.string "relationship"
    t.string "cel"
    t.integer "user_information_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_information_id"], name: "index_emergency_contacts_on_user_information_id"
  end

  create_table "medical_informations", force: :cascade do |t|
    t.string "nss"
    t.string "blod_type"
    t.string "allergies"
    t.string "donor"
    t.integer "user_information_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_information_id"], name: "index_medical_informations_on_user_information_id"
  end

  create_table "motorcycles", force: :cascade do |t|
    t.integer "state_id"
    t.integer "brand_id"
    t.integer "status_id"
    t.integer "yaer"
    t.string "serial"
    t.string "plates"
    t.string "mileage"
    t.string "invoice_number"
    t.string "model"
    t.string "description"
    t.string "color"
    t.string "image"
    t.string "serial_image"
    t.string "engine"
    t.string "cilinder"
    t.string "submarca"
    t.string "insurance"
    t.string "policy"
    t.boolean "is_a_driver"
    t.string "driver_name"
    t.string "report_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_motorcycles_on_brand_id"
    t.index ["state_id"], name: "index_motorcycles_on_state_id"
    t.index ["status_id"], name: "index_motorcycles_on_status_id"
    t.index ["user_id"], name: "index_motorcycles_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "var_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.string "var_name"
    t.string "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_informations", force: :cascade do |t|
    t.integer "user_id"
    t.string "full_name"
    t.string "last_name"
    t.string "address"
    t.integer "state_id"
    t.integer "user_type"
    t.integer "year_of_birth"
    t.string "motoclub"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_user_informations_on_state_id"
    t.index ["user_id"], name: "index_user_informations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.integer "user_type"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
