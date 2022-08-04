# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_04_181128) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "deacons", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_deacons_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "city"
    t.string "postcode"
    t.string "mobile"
    t.string "home_phone"
    t.string "work_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "overseers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_overseers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weddings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "mobile"
    t.datetime "proposed_wedding_date"
    t.datetime "actual_wedding_date"
    t.datetime "prenuptual_appointment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_weddings_on_user_id"
  end

  add_foreign_key "admins", "users"
  add_foreign_key "deacons", "members"
  add_foreign_key "members", "users"
  add_foreign_key "overseers", "users"
  add_foreign_key "weddings", "users"
end
