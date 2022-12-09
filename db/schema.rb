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

ActiveRecord::Schema.define(version: 2022_12_09_124551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "google_users", force: :cascade do |t|
    t.string "mail", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mail"], name: "index_google_users_on_mail", unique: true
  end

  create_table "sites", force: :cascade do |t|
    t.string "customer", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "content", null: false
    t.date "construction_date", null: false
    t.boolean "check", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "progress", default: 0, null: false
  end

  create_table "tentative_users", force: :cascade do |t|
    t.string "mail", null: false
    t.string "token", limit: 64, null: false
    t.datetime "expired_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mail"], name: "index_tentative_users_on_mail", unique: true
    t.index ["token"], name: "index_tentative_users_on_token", unique: true
  end

  create_table "user_sites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "site_id", null: false
    t.integer "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_user_sites_on_site_id"
    t.index ["user_id"], name: "index_user_sites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 16, null: false
    t.string "mail", null: false
    t.string "password_digest", null: false
    t.string "account_id", limit: 16, null: false
    t.string "image", null: false
    t.string "self_introduction", limit: 100
    t.string "position", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_users_on_account_id", unique: true
    t.index ["mail"], name: "index_users_on_mail", unique: true
  end

  add_foreign_key "user_sites", "sites"
  add_foreign_key "user_sites", "users"
end
