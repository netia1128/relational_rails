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

ActiveRecord::Schema.define(version: 2021_05_11_170044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "b1_permits", force: :cascade do |t|
    t.bigint "b3_facilities_id"
    t.string "b1_special_text"
    t.string "b1_appl_status"
    t.string "b1_per_sub_type"
    t.datetime "b1_expiration"
    t.boolean "b1_extraction"
    t.integer "b1_plant_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["b3_facilities_id"], name: "index_b1_permits_on_b3_facilities_id"
  end

  create_table "b3_contacts", force: :cascade do |t|
    t.bigint "b1_permits_id"
    t.boolean "b3_primary_flag"
    t.string "b3_contact_type"
    t.string "b3_fname"
    t.string "b3_lname"
    t.integer "b3_phone"
    t.integer "b3_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["b1_permits_id"], name: "index_b3_contacts_on_b1_permits_id"
  end

  create_table "b3_facilities", force: :cascade do |t|
    t.integer "b3_street_number"
    t.string "b3_street_name"
    t.string "b3_street_type"
    t.string "b3_unit_info"
    t.string "b3_city"
    t.string "b3_state"
    t.integer "b3_zip"
    t.boolean "b3_has_co"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "b1_permits", "b3_facilities", column: "b3_facilities_id"
  add_foreign_key "b3_contacts", "b1_permits", column: "b1_permits_id"
end
