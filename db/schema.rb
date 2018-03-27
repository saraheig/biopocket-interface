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

ActiveRecord::Schema.define(version: 20180327122423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.bigint "theme_id"
    t.bigint "type_id"
    t.string "title", limit: 40
    t.string "description", limit: 255
    t.text "impact"
    t.integer "investment", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "spot"
    t.integer "cost_min"
    t.integer "time_min"
    t.integer "time_unit", limit: 2
    t.text "time_description"
    t.decimal "surface_min", precision: 10, scale: 2
    t.text "picture"
    t.integer "importance", limit: 2
    t.index ["theme_id"], name: "index_actions_on_theme_id"
    t.index ["type_id"], name: "index_actions_on_type_id"
  end

  create_table "actions_actions", force: :cascade do |t|
    t.bigint "ref_id"
    t.bigint "dep_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dep_id"], name: "index_actions_actions_on_dep_id"
    t.index ["ref_id"], name: "index_actions_actions_on_ref_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["task_id"], name: "index_pictures_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", limit: 100
    t.text "description"
    t.bigint "action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_tasks_on_action_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "title", limit: 40
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "picture"
  end

  create_table "types", force: :cascade do |t|
    t.string "title", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
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
  add_foreign_key "tasks", "actions"
end
