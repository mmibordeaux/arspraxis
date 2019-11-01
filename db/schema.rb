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

ActiveRecord::Schema.define(version: 2019_11_01_065756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competencies", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.text "description"
    t.integer "number"
    t.bigint "referential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "essential_components"
    t.index ["referential_id"], name: "index_competencies_on_referential_id"
  end

  create_table "critical_learnings", force: :cascade do |t|
    t.bigint "competency_id"
    t.bigint "level_id"
    t.text "description"
    t.integer "number"
    t.text "not_reached"
    t.text "partially_reached"
    t.text "reached"
    t.text "over_reached"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competency_id"], name: "index_critical_learnings_on_competency_id"
    t.index ["level_id"], name: "index_critical_learnings_on_level_id"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.bigint "referential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referential_id"], name: "index_levels_on_referential_id"
  end

  create_table "referentials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "origin"
    t.text "description"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "competency_id"
    t.index ["competency_id"], name: "index_resources_on_competency_id"
  end

  create_table "situations", force: :cascade do |t|
    t.text "description"
    t.integer "number"
    t.bigint "competency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competency_id"], name: "index_situations_on_competency_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "competencies", "referentials"
  add_foreign_key "critical_learnings", "competencies"
  add_foreign_key "critical_learnings", "levels"
  add_foreign_key "levels", "referentials"
  add_foreign_key "resources", "competencies"
  add_foreign_key "situations", "competencies"
end
