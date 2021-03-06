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

ActiveRecord::Schema.define(version: 20191028111615) do

  create_table "brand_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credentials_on_user_id", using: :btree
  end

  create_table "creditcards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "card_id",     null: false
    t.string   "customer_id", null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_creditcards_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535
    t.integer  "product_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",           null: false
    t.string   "comment",        null: false
    t.integer  "price",          null: false
    t.integer  "status",         null: false
    t.integer  "costcharge",     null: false
    t.string   "delivery_way",   null: false
    t.string   "delivery_area",  null: false
    t.string   "delivery_date",  null: false
    t.integer  "buyer_id"
    t.integer  "seller_id",      null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "category_id"
    t.integer  "likes_count"
    t.integer  "size_id"
    t.integer  "brand_id"
    t.integer  "transaction_id"
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["buyer_id"], name: "index_products_on_buyer_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["seller_id"], name: "index_products_on_seller_id", using: :btree
    t.index ["size_id"], name: "index_products_on_size_id", using: :btree
  end

  create_table "searchsize_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "size_id"
    t.integer  "searchsize_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["searchsize_id"], name: "index_searchsize_sizes_on_searchsize_id", using: :btree
    t.index ["size_id"], name: "index_searchsize_sizes_on_size_id", using: :btree
  end

  create_table "searchsizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "set_brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "brand_id",          null: false
    t.integer  "brand_category_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["brand_category_id"], name: "index_set_brands_on_brand_category_id", using: :btree
    t.index ["brand_id"], name: "index_set_brands_on_brand_id", using: :btree
  end

  create_table "size_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "size_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_size_categories_on_category_id", using: :btree
    t.index ["size_id"], name: "index_size_categories_on_size_id", using: :btree
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streetaddresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "last_name",       null: false
    t.string   "first_name",      null: false
    t.string   "last_name_kana",  null: false
    t.string   "first_name_kana", null: false
    t.string   "post_number",     null: false
    t.integer  "prefecture",      null: false
    t.string   "city",            null: false
    t.string   "address",         null: false
    t.string   "building_name"
    t.string   "phone_number"
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
    t.string   "phone_number",                                      null: false
    t.string   "last_name",                                         null: false
    t.string   "last_name_kana",                                    null: false
    t.integer  "birth_month",                                       null: false
    t.integer  "birth_day",                                         null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "credentials", "users"
  add_foreign_key "creditcards", "users"
  add_foreign_key "images", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "users", column: "buyer_id"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "searchsize_sizes", "searchsizes"
  add_foreign_key "searchsize_sizes", "sizes"
  add_foreign_key "set_brands", "brand_categories"
  add_foreign_key "set_brands", "brands"
  add_foreign_key "size_categories", "sizes"
  add_foreign_key "streetaddresses", "users"
end
