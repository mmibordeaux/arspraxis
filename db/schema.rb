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

ActiveRecord::Schema.define(version: 2019_11_07_062322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "program_groups", force: :cascade do |t|
    t.integer "year"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_groups_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "country"
    t.bigint "referential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referential_id"], name: "index_programs_on_referential_id"
  end

  create_table "referential_competencies", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.text "description"
    t.integer "number"
    t.bigint "referential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "essential_components"
    t.index ["referential_id"], name: "index_referential_competencies_on_referential_id"
  end

  create_table "referential_critical_learnings", force: :cascade do |t|
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
    t.index ["competency_id"], name: "index_referential_critical_learnings_on_competency_id"
    t.index ["level_id"], name: "index_referential_critical_learnings_on_level_id"
  end

  create_table "referential_levels", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.bigint "referential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referential_id"], name: "index_referential_levels_on_referential_id"
  end

  create_table "referential_resources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "competency_id"
    t.index ["competency_id"], name: "index_referential_resources_on_competency_id"
  end

  create_table "referential_situations", force: :cascade do |t|
    t.text "description"
    t.integer "number"
    t.bigint "competency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competency_id"], name: "index_referential_situations_on_competency_id"
  end

  create_table "referentials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "origin"
    t.text "description"
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

  add_foreign_key "program_groups", "programs"
  add_foreign_key "programs", "referentials"
  add_foreign_key "referential_competencies", "referentials"
  add_foreign_key "referential_critical_learnings", "referential_competencies", column: "competency_id"
  add_foreign_key "referential_critical_learnings", "referential_levels", column: "level_id"
  add_foreign_key "referential_levels", "referentials"
  add_foreign_key "referential_resources", "referential_competencies", column: "competency_id"
  add_foreign_key "referential_situations", "referential_competencies", column: "competency_id"
end
