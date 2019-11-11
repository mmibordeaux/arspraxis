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

ActiveRecord::Schema.define(version: 2019_11_11_102950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "program_groups", force: :cascade do |t|
    t.integer "year"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_groups_on_program_id"
  end

  create_table "program_teachers", force: :cascade do |t|
    t.bigint "program_id"
    t.bigint "user_id"
    t.string "role"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_teachers_on_program_id"
    t.index ["user_id"], name: "index_program_teachers_on_user_id"
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
    t.bigint "referential_id"
    t.string "name"
    t.index ["competency_id"], name: "index_referential_critical_learnings_on_competency_id"
    t.index ["level_id"], name: "index_referential_critical_learnings_on_level_id"
    t.index ["referential_id"], name: "index_referential_critical_learnings_on_referential_id"
  end

  create_table "referential_levels", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.bigint "referential_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["referential_id"], name: "index_referential_levels_on_referential_id"
  end

  create_table "referential_managers", force: :cascade do |t|
    t.bigint "referential_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["referential_id"], name: "index_referential_managers_on_referential_id"
    t.index ["user_id"], name: "index_referential_managers_on_user_id"
  end

  create_table "referential_resources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "competency_id"
    t.bigint "referential_id"
    t.index ["competency_id"], name: "index_referential_resources_on_competency_id"
    t.index ["referential_id"], name: "index_referential_resources_on_referential_id"
  end

  create_table "referential_situations", force: :cascade do |t|
    t.text "description"
    t.integer "number"
    t.bigint "competency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "referential_id"
    t.string "name"
    t.index ["competency_id"], name: "index_referential_situations_on_competency_id"
    t.index ["referential_id"], name: "index_referential_situations_on_referential_id"
  end

  create_table "referentials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "origin"
    t.text "description"
  end

  create_table "user_publications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "program_group_id"
    t.string "title"
    t.text "content"
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_group_id"], name: "index_user_publications_on_program_group_id"
    t.index ["user_id"], name: "index_user_publications_on_user_id"
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
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "program_groups", "programs"
  add_foreign_key "program_teachers", "programs"
  add_foreign_key "program_teachers", "users"
  add_foreign_key "programs", "referentials"
  add_foreign_key "referential_competencies", "referentials"
  add_foreign_key "referential_critical_learnings", "referential_competencies", column: "competency_id"
  add_foreign_key "referential_critical_learnings", "referential_levels", column: "level_id"
  add_foreign_key "referential_levels", "referentials"
  add_foreign_key "referential_managers", "referentials"
  add_foreign_key "referential_managers", "users"
  add_foreign_key "referential_resources", "referential_competencies", column: "competency_id"
  add_foreign_key "referential_situations", "referential_competencies", column: "competency_id"
  add_foreign_key "user_publications", "program_groups"
  add_foreign_key "user_publications", "users"
end
