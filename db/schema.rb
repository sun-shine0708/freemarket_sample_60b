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

ActiveRecord::Schema.define(version: 20191010053214) do

  create_table "creditcards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "card_number",      null: false
    t.integer  "expiration_month", null: false
    t.integer  "expiration_year",  null: false
    t.integer  "security_code",    null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_creditcards_on_user_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          null: false
    t.string   "comment",       null: false
    t.integer  "price",         null: false
    t.string   "size"
    t.string   "status",        null: false
    t.string   "costcharge",    null: false
    t.string   "delivery_way",  null: false
    t.string   "delivery_area", null: false
    t.string   "delivery_date", null: false
    t.integer  "buyer_id",      null: false
    t.integer  "seller_id",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["buyer_id"], name: "index_products_on_buyer_id", using: :btree
    t.index ["name"], name: "index_products_on_name", unique: true, using: :btree
    t.index ["seller_id"], name: "index_products_on_seller_id", using: :btree
  end

  create_table "streetaddresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "first_name_kana", null: false
    t.string   "last_name_kana",  null: false
    t.integer  "post_number",     null: false
    t.string   "prefectures",     null: false
    t.string   "city",            null: false
    t.string   "address",         null: false
    t.string   "building_name"
    t.integer  "phone_number"
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_streetaddresses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",                                        null: false
    t.string   "first_name_kana",                                   null: false
    t.string   "nickname",                                          null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.integer  "birth_year",                                        null: false
    t.text     "comment",                limit: 65535
    t.text     "image",                  limit: 65535
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "phone_number",                                      null: false
    t.string   "last_name",                                         null: false
    t.string   "last_name_kana",                                    null: false
    t.integer  "birth_month",                                       null: false
    t.integer  "birth_day",                                         null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "creditcards", "users"
  add_foreign_key "products", "users", column: "buyer_id"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "streetaddresses", "users"
end
