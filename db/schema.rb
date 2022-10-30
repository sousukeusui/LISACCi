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

ActiveRecord::Schema.define(version: 2022_10_30_124950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tentative_users", force: :cascade do |t|
    t.string "mail", null: false
    t.string "token", limit: 64, null: false
    t.datetime "expired_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
  end

end
