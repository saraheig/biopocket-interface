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

ActiveRecord::Schema.define(version: 20180323135516) do

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
  add_foreign_key "costs", "actions"
end
