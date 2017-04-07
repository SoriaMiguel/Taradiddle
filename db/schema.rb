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

ActiveRecord::Schema.define(version: 20170405200657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "oauth_token"
    t.string   "oauth_verifier"
    t.string   "user_oauth_token"
    t.string   "user_oauth_secret"
  end

  create_table "blocks", force: :cascade do |t|
    t.integer  "routine_id"
    t.string   "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["routine_id"], name: "index_blocks_on_routine_id", using: :btree
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.integer  "reps"
    t.integer  "duration_in_seconds"
    t.text     "description"
    t.string   "picture"
    t.integer  "block_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["block_id"], name: "index_exercises_on_block_id", using: :btree
  end

  create_table "routines", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_routines_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_foreign_key "blocks", "routines"
  add_foreign_key "exercises", "blocks"
  add_foreign_key "routines", "users"
end
