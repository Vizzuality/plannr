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

ActiveRecord::Schema.define(version: 20160927131601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "project_id"
    t.date     "planned_date"
    t.string   "name"
    t.date     "date_sent"
    t.decimal  "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "payed_on"
  end

  create_table "milestones", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "milestone"
    t.date     "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
  end

  create_table "project_reports", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "report_id"
    t.float    "total_time",   default: 0.0
    t.json     "breakdown",    default: "{}"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "project_name"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.decimal  "budget"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "archived",           default: false
    t.integer  "project_manager_id"
    t.integer  "score",              default: 0
    t.integer  "team_id"
    t.integer  "client_id"
    t.string   "intranet_url"
  end

  create_table "reports", force: :cascade do |t|
    t.date     "report_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.decimal  "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_manager_id"
    t.boolean  "active",             default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "tech_lead_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "title"
    t.string   "password_digest"
    t.string   "role"
  end

  add_foreign_key "invoices", "projects"
  add_foreign_key "milestones", "projects"
  add_foreign_key "project_reports", "projects"
  add_foreign_key "project_reports", "reports"
  add_foreign_key "projects", "users", column: "project_manager_id"
  add_foreign_key "rosters", "teams"
  add_foreign_key "rosters", "users"
  add_foreign_key "teams", "users", column: "project_manager_id"
  add_foreign_key "teams", "users", column: "tech_lead_id"
end
