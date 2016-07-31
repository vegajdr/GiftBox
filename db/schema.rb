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

ActiveRecord::Schema.define(version: 20160731193415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nonce"
    t.string   "name"
    t.datetime "expires_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nonce"], name: "index_auth_tokens_on_nonce", using: :btree
    t.index ["user_id"], name: "index_auth_tokens_on_user_id", using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "hex"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.boolean  "preset?"
    t.index ["user_id"], name: "index_colors_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "color"
    t.string   "animal"
    t.string   "season"
    t.string   "restaurant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "custom"
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.index ["user_id"], name: "index_friendships_on_user_id", using: :btree
  end

  create_table "holidays", force: :cascade do |t|
    t.string   "name"
    t.string   "season"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "preset?",       default: false
    t.string   "holiday_day"
    t.string   "holiday_month"
    t.string   "holiday_year"
  end

  create_table "ideaboxes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ideaboxes_on_user_id", using: :btree
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "preset?",    default: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "created_by"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_holidays", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "user_holiday_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["item_id"], name: "index_item_holidays_on_item_id", using: :btree
    t.index ["user_holiday_id"], name: "index_item_holidays_on_user_holiday_id", using: :btree
  end

  create_table "item_interests", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "user_interest_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["item_id"], name: "index_item_interests_on_item_id", using: :btree
    t.index ["user_interest_id"], name: "index_item_interests_on_user_interest_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.boolean  "purchased?",       default: false
    t.integer  "wishlist_id"
    t.integer  "user_interest_id"
    t.integer  "user_holiday_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "product_url"
    t.string   "image_url"
    t.integer  "ideabox_id"
    t.text     "description"
    t.index ["ideabox_id"], name: "index_items_on_ideabox_id", using: :btree
    t.index ["user_holiday_id"], name: "index_items_on_user_holiday_id", using: :btree
    t.index ["user_interest_id"], name: "index_items_on_user_interest_id", using: :btree
    t.index ["wishlist_id"], name: "index_items_on_wishlist_id", using: :btree
  end

  create_table "special_days", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "sd_day"
    t.string   "sd_month"
    t.string   "sd_year"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_special_days_on_user_id", using: :btree
  end

  create_table "user_holidays", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "holiday_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holiday_id"], name: "index_user_holidays_on_holiday_id", using: :btree
    t.index ["user_id"], name: "index_user_holidays_on_user_id", using: :btree
  end

  create_table "user_interests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["interest_id"], name: "index_user_interests_on_interest_id", using: :btree
    t.index ["user_id"], name: "index_user_interests_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "dob_day"
    t.string   "dob_month"
    t.string   "dob_year"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook_token"
    t.json     "facebook_data"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  create_table "wishlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "name"
    t.index ["user_id"], name: "index_wishlists_on_user_id", using: :btree
  end

  add_foreign_key "auth_tokens", "users"
  add_foreign_key "colors", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "friendships", "users"
  add_foreign_key "ideaboxes", "users"
  add_foreign_key "item_holidays", "items"
  add_foreign_key "item_holidays", "user_holidays"
  add_foreign_key "item_interests", "items"
  add_foreign_key "item_interests", "user_interests"
  add_foreign_key "items", "ideaboxes"
  add_foreign_key "items", "user_holidays"
  add_foreign_key "items", "user_interests"
  add_foreign_key "items", "wishlists"
  add_foreign_key "special_days", "users"
  add_foreign_key "user_holidays", "holidays"
  add_foreign_key "user_holidays", "users"
  add_foreign_key "user_interests", "interests"
  add_foreign_key "user_interests", "users"
  add_foreign_key "wishlists", "users"
end
