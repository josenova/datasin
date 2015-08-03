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

ActiveRecord::Schema.define(version: 20150727213118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claim_statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claim_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claims", force: :cascade do |t|
    t.date     "date"
    t.string   "number"
    t.decimal  "amount",          precision: 8, scale: 2
    t.text     "description"
    t.integer  "policy_id"
    t.integer  "vehicle_id"
    t.integer  "claim_type_id"
    t.integer  "claim_status_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "claims", ["claim_status_id"], name: "index_claims_on_claim_status_id", using: :btree
  add_index "claims", ["claim_type_id"], name: "index_claims_on_claim_type_id", using: :btree
  add_index "claims", ["policy_id"], name: "index_claims_on_policy_id", using: :btree
  add_index "claims", ["vehicle_id"], name: "index_claims_on_vehicle_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "identification"
    t.boolean  "gender"
    t.date     "birthdate"
    t.text     "address"
    t.string   "occupation"
    t.integer  "sector_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "clients", ["sector_id"], name: "index_clients_on_sector_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "rnc"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sector_id"
  end

  add_index "companies", ["sector_id"], name: "index_companies_on_sector_id", using: :btree

  create_table "insurances", force: :cascade do |t|
    t.string   "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "policies", force: :cascade do |t|
    t.string   "policy"
    t.boolean  "coverage"
    t.date     "start"
    t.date     "end"
    t.integer  "insurance_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "client_id"
    t.integer  "company_id"
  end

  add_index "policies", ["client_id"], name: "index_policies_on_client_id", using: :btree
  add_index "policies", ["company_id"], name: "index_policies_on_company_id", using: :btree
  add_index "policies", ["insurance_id"], name: "index_policies_on_insurance_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "client_query"
    t.string   "vehicle_query"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sectors", ["city_id"], name: "index_sectors_on_city_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "insurance_id"
    t.boolean  "active",                 default: true
    t.string   "name"
    t.string   "surname"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["insurance_id"], name: "index_users_on_insurance_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "vehicle_brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_brand_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "vehicle_models", ["vehicle_brand_id"], name: "index_vehicle_models_on_vehicle_brand_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.integer  "vehicle_model_id"
    t.integer  "year"
    t.string   "vin"
    t.string   "plate"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "policy_id"
  end

  add_index "vehicles", ["policy_id"], name: "index_vehicles_on_policy_id", using: :btree
  add_index "vehicles", ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id", using: :btree

  add_foreign_key "claims", "claim_statuses"
  add_foreign_key "claims", "claim_types"
  add_foreign_key "claims", "policies"
  add_foreign_key "claims", "vehicles"
  add_foreign_key "clients", "sectors"
  add_foreign_key "companies", "sectors"
  add_foreign_key "policies", "clients"
  add_foreign_key "policies", "companies"
  add_foreign_key "policies", "insurances"
  add_foreign_key "searches", "users"
  add_foreign_key "sectors", "cities"
  add_foreign_key "users", "insurances"
  add_foreign_key "vehicle_models", "vehicle_brands"
  add_foreign_key "vehicles", "policies"
  add_foreign_key "vehicles", "vehicle_models"
end
