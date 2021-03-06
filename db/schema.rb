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

ActiveRecord::Schema.define(version: 20150206205911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "headline_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["headline_id"], name: "index_comments_on_headline_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "headlines", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "vote_count",                     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "source_names"
    t.text     "name_hash"
    t.integer  "depth",                          default: 2
    t.integer  "creator_id"
    t.integer  "comments_count",                 default: 0, null: false
    t.text     "photo_data"
    t.datetime "bot_shared_at"
    t.string   "bot_share_tweet_id", limit: 255
  end

  add_index "headlines", ["created_at"], name: "index_headlines_on_created_at", using: :btree
  add_index "headlines", ["creator_id"], name: "index_headlines_on_creator_id", using: :btree
  add_index "headlines", ["name_hash"], name: "index_headlines_on_name_hash", unique: true, using: :btree
  add_index "headlines", ["vote_count"], name: "index_headlines_on_vote_count", using: :btree

  create_table "source_headline_fragments", force: :cascade do |t|
    t.integer  "source_headline_id"
    t.integer  "headline_id"
    t.integer  "source_headline_start"
    t.integer  "source_headline_end"
    t.integer  "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "source_headline_fragments", ["headline_id"], name: "index_source_headline_fragments_on_headline_id", using: :btree
  add_index "source_headline_fragments", ["source_headline_id"], name: "index_source_headline_fragments_on_source_headline_id", using: :btree

  create_table "source_headlines", force: :cascade do |t|
    t.string   "source_id",    limit: 255
    t.text     "name"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name_hash"
    t.datetime "published_at"
    t.string   "fetcher",      limit: 255
    t.string   "author",       limit: 255
    t.string   "section",      limit: 255
  end

  add_index "source_headlines", ["source_id", "name_hash"], name: "index_source_headlines_on_source_id_and_name_hash", unique: true, using: :btree
  add_index "source_headlines", ["source_id"], name: "index_source_headlines_on_source_id", using: :btree

  create_table "sources", id: false, force: :cascade do |t|
    t.string "id"
    t.json   "json"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",                 limit: 255, default: "", null: false
    t.string   "encrypted_password",    limit: 255, default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",    limit: 255
    t.string   "last_sign_in_ip",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote_count",                        default: 0,  null: false
    t.integer  "karma",                             default: 0,  null: false
    t.integer  "comments_count",                    default: 0,  null: false
    t.string   "api_key",               limit: 255
    t.integer  "api_requests",                      default: 0,  null: false
    t.integer  "saved_headlines_count",             default: 0,  null: false
  end

  add_index "users", ["api_key"], name: "index_users_on_api_key", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "headline_id"
    t.integer  "user_id"
    t.string   "ip",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["headline_id"], name: "index_votes_on_headline_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
