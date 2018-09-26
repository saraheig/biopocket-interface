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

ActiveRecord::Schema.define(version: 20180926134428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.bigint "theme_id"
    t.bigint "type_id"
    t.string "title", limit: 40
    t.text "description"
    t.text "impact"
    t.integer "investment", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "spot"
    t.integer "cost_min"
    t.integer "time_min"
    t.text "time_description"
    t.decimal "surface_min", precision: 10, scale: 2
    t.integer "importance", limit: 2
    t.bigint "unit_id"
    t.string "code", limit: 10
    t.string "short_description", limit: 255
    t.string "complement_title", limit: 30
    t.text "complement_description"
    t.index ["theme_id"], name: "index_actions_on_theme_id"
    t.index ["title"], name: "index_actions_on_title", unique: true
    t.index ["type_id"], name: "index_actions_on_type_id"
    t.index ["unit_id"], name: "index_actions_on_unit_id"
  end

  create_table "actions_actions", force: :cascade do |t|
    t.bigint "ref_id"
    t.bigint "dep_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dep_id"], name: "index_actions_actions_on_dep_id"
    t.index ["ref_id", "dep_id"], name: "index_actions_actions_on_ref_id_and_dep_id", unique: true
    t.index ["ref_id"], name: "index_actions_actions_on_ref_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_categories_on_title", unique: true
  end

  create_table "costs", force: :cascade do |t|
    t.string "title", limit: 40
    t.decimal "value_min", precision: 10, scale: 2
    t.decimal "value_max", precision: 10, scale: 2
    t.string "unit", limit: 20
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_costs_on_action_id"
  end

  create_table "links", force: :cascade do |t|
    t.text "link"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_links_on_task_id"
  end

  create_table "periods", force: :cascade do |t|
    t.integer "startdate", limit: 2
    t.integer "enddate", limit: 2
    t.text "description"
    t.bigint "task_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_periods_on_category_id"
    t.index ["task_id"], name: "index_periods_on_task_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.text "picture"
    t.text "description"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "source"
    t.index ["task_id"], name: "index_pictures_on_task_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "common_name", limit: 40
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latin_name", limit: 100
    t.index ["common_name"], name: "index_species_on_common_name", unique: true
  end

  create_table "species_actions", force: :cascade do |t|
    t.bigint "species_id"
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id", "species_id"], name: "index_species_actions_on_action_id_and_species_id", unique: true
    t.index ["action_id"], name: "index_species_actions_on_action_id"
    t.index ["species_id"], name: "index_species_actions_on_species_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", limit: 100
    t.text "description"
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code", limit: 10
    t.string "time", limit: 1500
    t.string "constraint_task", limit: 1500
    t.string "recommendation", limit: 1500
    t.string "complement_title", limit: 30
    t.text "complement_description"
    t.index ["action_id"], name: "index_tasks_on_action_id"
    t.index ["title"], name: "index_tasks_on_title", unique: true
  end

  create_table "tasks_tasks", force: :cascade do |t|
    t.bigint "ref_id"
    t.bigint "dep_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dep_id"], name: "index_tasks_tasks_on_dep_id"
    t.index ["ref_id", "dep_id"], name: "index_tasks_tasks_on_ref_id_and_dep_id", unique: true
    t.index ["ref_id"], name: "index_tasks_tasks_on_ref_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "title", limit: 40
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code", limit: 5
    t.string "short_description", limit: 255
    t.index ["title"], name: "index_themes_on_title", unique: true
  end

  create_table "types", force: :cascade do |t|
    t.string "title", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["title"], name: "index_types_on_title", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.string "name", limit: 40
    t.string "abbreviation", limit: 40
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_units_on_abbreviation", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "pseudo"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["pseudo"], name: "index_users_on_pseudo", unique: true
  end

  add_foreign_key "actions", "themes"
  add_foreign_key "actions", "types"
  add_foreign_key "actions_actions", "actions", column: "dep_id"
  add_foreign_key "actions_actions", "actions", column: "ref_id"
  add_foreign_key "costs", "actions"
  add_foreign_key "links", "tasks"
  add_foreign_key "periods", "categories"
  add_foreign_key "periods", "tasks"
  add_foreign_key "pictures", "tasks"
  add_foreign_key "species_actions", "actions"
  add_foreign_key "species_actions", "species"
  add_foreign_key "tasks", "actions"
  add_foreign_key "tasks_tasks", "tasks", column: "dep_id"
  add_foreign_key "tasks_tasks", "tasks", column: "ref_id"
end
