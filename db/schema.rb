# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160110215020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rewards", force: :cascade do |t|
    t.string   "name"
    t.integer  "cost"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "user_rewards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_id"
  end

  add_index "user_rewards", ["reward_id"], name: "index_user_rewards_on_reward_id", using: :btree
  add_index "user_rewards", ["user_id"], name: "index_user_rewards_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "role",            default: 0
    t.integer  "points",          default: 0
    t.integer  "redeemed_points", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "user_rewards", "rewards"
  add_foreign_key "user_rewards", "users"
end
