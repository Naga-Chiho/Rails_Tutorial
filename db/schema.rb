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

ActiveRecord::Schema[8.1].define(version: 2026_06_18_081557) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.date "birthday"
    t.string "building"
    t.string "city"
    t.datetime "created_at", null: false
    t.bigint "department_id", null: false
    t.string "email"
    t.string "furigana"
    t.string "gender"
    t.binary "image"
    t.string "mobile_phone"
    t.string "name"
    t.string "password_digest"
    t.string "phone"
    t.string "postal_code"
    t.string "prefecture"
    t.string "street"
    t.string "town"
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_users_on_department_id"
  end

  create_table "users_skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "skill_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["skill_id"], name: "index_users_skills_on_skill_id"
    t.index ["user_id"], name: "index_users_skills_on_user_id"
  end

  add_foreign_key "users", "departments"
  add_foreign_key "users_skills", "skills"
  add_foreign_key "users_skills", "users"
end
