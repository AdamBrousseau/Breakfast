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

ActiveRecord::Schema.define(version: 20140320214949) do

  create_table "ailments", force: true do |t|
    t.string   "ailment_name"
    t.date     "begin_date"
    t.date     "end_date"
    t.string   "ailment_description"
    t.integer  "phr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",             default: false
  end

  add_index "ailments", ["phr_id"], name: "index_ailments_on_phr_id"

  create_table "allergies", force: true do |t|
    t.string   "allergy_name"
    t.string   "allergy_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phr_id"
    t.boolean  "deleted",             default: false
    t.date     "date"
  end

  create_table "appointments", force: true do |t|
    t.string   "doctor"
    t.string   "reason"
    t.string   "results"
    t.integer  "phr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bglucoses", force: true do |t|
    t.float    "sugar"
    t.datetime "date"
    t.string   "btype"
    t.integer  "phr_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bps", force: true do |t|
    t.integer  "systolic"
    t.integer  "diastolic"
    t.string   "condition"
    t.integer  "phr_id"
    t.datetime "date"
    t.boolean  "deleted",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"

  create_table "dentals", force: true do |t|
    t.string   "dentist"
    t.date     "last_cleaning"
    t.integer  "phr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eyes", force: true do |t|
    t.integer  "phr_id"
    t.datetime "date"
    t.float    "glass_od_sph"
    t.float    "glass_od_cyl"
    t.integer  "glass_od_axis"
    t.float    "glass_od_prism"
    t.string   "glass_od_base"
    t.float    "glass_od_add"
    t.float    "glass_os_sph"
    t.float    "glass_os_cyl"
    t.integer  "glass_os_axis"
    t.float    "glass_os_prism"
    t.string   "glass_os_base"
    t.float    "glass_os_add"
    t.float    "cont_od_pwr"
    t.float    "cont_od_bc"
    t.float    "cont_od_dia"
    t.float    "cont_od_cyl"
    t.integer  "cont_od_axis"
    t.float    "cont_od_add"
    t.string   "cont_od_colour"
    t.string   "cont_od_brand"
    t.float    "cont_os_pwr"
    t.float    "cont_os_bc"
    t.float    "cont_os_dia"
    t.float    "cont_os_cyl"
    t.integer  "cont_os_axis"
    t.float    "cont_os_add"
    t.string   "cont_os_colour"
    t.string   "cont_os_brand"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",        default: false
    t.string   "comment2"
    t.string   "doctor"
  end

  add_index "eyes", ["phr_id", "date"], name: "index_eyes_on_phr_id_and_date"

  create_table "fitnesses", force: true do |t|
    t.float    "weight"
    t.float    "height"
    t.date     "date"
    t.boolean  "deleted",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phr_id"
  end

  create_table "immunizations", force: true do |t|
    t.string   "immunization"
    t.date     "date"
    t.date     "expiry"
    t.integer  "phr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "immunizations", ["phr_id"], name: "index_immunizations_on_phr_id"

  create_table "medications", force: true do |t|
    t.string   "medication"
    t.string   "drug"
    t.datetime "begin_date"
    t.integer  "duration"
    t.float    "dosage"
    t.integer  "frequency"
    t.string   "ailment"
    t.string   "prescribing_doctor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",            default: false
    t.integer  "phr_id"
  end

  create_table "phrs", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.string   "gender"
    t.string   "blood_type"
    t.string   "health_card_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "deleted",        default: false
  end

  add_index "phrs", ["user_id"], name: "index_phrs_on_user_id"

  create_table "tests", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.text     "comments"
    t.integer  "phr_id"
    t.string   "test_file_name"
    t.string   "test_content_type"
    t.integer  "test_file_size"
    t.datetime "test_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",           default: false
    t.string   "doctor"
  end

  add_index "tests", ["phr_id", "date"], name: "index_tests_on_phr_id_and_date"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",            default: false
    t.boolean  "active",           default: false
    t.string   "activation_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
