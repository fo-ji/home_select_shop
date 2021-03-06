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

ActiveRecord::Schema.define(version: 2020_07_29_124434) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "postal_code", null: false
    t.integer "prefecture", default: 1, null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "apartment"
    t.string "phone_number", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "brand", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand"], name: "index_brands_on_brand"
  end

  create_table "cart_coordinates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.bigint "coordinate_id", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_coordinates_on_cart_id"
    t.index ["coordinate_id"], name: "index_cart_coordinates_on_coordinate_id"
  end

  create_table "cart_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.bigint "item_id", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
  end

  create_table "carts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "communities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "owner", null: false
    t.text "avatar", null: false
    t.text "introduction", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_communities_on_name", unique: true
    t.index ["shop_id"], name: "index_communities_on_shop_id"
  end

  create_table "community_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_users_on_community_id"
    t.index ["user_id"], name: "index_community_users_on_user_id"
  end

  create_table "coordinate_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "coordinate_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinate_id"], name: "index_coordinate_items_on_coordinate_id"
    t.index ["item_id"], name: "index_coordinate_items_on_item_id"
  end

  create_table "coordinate_payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "purchase_amount", null: false
    t.string "charge_id"
    t.bigint "user_id", null: false
    t.bigint "coordinate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinate_id"], name: "index_coordinate_payments_on_coordinate_id"
    t.index ["user_id"], name: "index_coordinate_payments_on_user_id"
  end

  create_table "coordinates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "total_price", null: false
    t.integer "set", default: 1, null: false
    t.text "explain", null: false
    t.integer "postage", default: 1, null: false
    t.integer "shipping_date", default: 1, null: false
    t.integer "gender", default: 1, null: false
    t.text "image", null: false
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_coordinates_on_shop_id"
    t.index ["user_id"], name: "index_coordinates_on_user_id"
  end

  create_table "credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_image", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "item_payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "purchase_amount", null: false
    t.string "charge_id"
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_payments_on_item_id"
    t.index ["user_id"], name: "index_item_payments_on_user_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.text "explain", null: false
    t.integer "size", default: 4, null: false
    t.integer "postage", default: 1, null: false
    t.integer "shipping_date", default: 1, null: false
    t.integer "gender", default: 1, null: false
    t.integer "stock", default: 1, null: false
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["gender"], name: "index_items_on_gender"
    t.index ["name"], name: "index_items_on_name", unique: true
    t.index ["price"], name: "index_items_on_price"
    t.index ["shop_id"], name: "index_items_on_shop_id"
    t.index ["size"], name: "index_items_on_size"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "recommends", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "image", null: false
    t.integer "genre", default: 0, null: false
    t.text "introduction", null: false
    t.text "url"
    t.bigint "user_id", null: false
    t.bigint "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_recommends_on_community_id"
    t.index ["user_id"], name: "index_recommends_on_user_id"
  end

  create_table "shops", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.text "avatar"
    t.text "introduction"
    t.string "postal_code", null: false
    t.integer "prefecture", default: 1, null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "apartment"
    t.string "phone_number", null: false
    t.text "official_site"
    t.text "facebook_account"
    t.text "line_account"
    t.text "instagram_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shops_on_name", unique: true
  end

  create_table "stylists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_stylists_on_shop_id"
    t.index ["user_id"], name: "index_stylists_on_user_id"
  end

  create_table "talks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "talk"
    t.string "image"
    t.bigint "community_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_talks_on_community_id"
    t.index ["user_id"], name: "index_talks_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.text "avatar"
    t.text "introduction"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.date "birthday", null: false
    t.integer "height", null: false
    t.integer "body_weight", null: false
    t.integer "foot_size", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cart_coordinates", "carts"
  add_foreign_key "cart_coordinates", "coordinates"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "items"
  add_foreign_key "communities", "shops"
  add_foreign_key "community_users", "communities"
  add_foreign_key "community_users", "users"
  add_foreign_key "coordinate_items", "coordinates"
  add_foreign_key "coordinate_items", "items"
  add_foreign_key "coordinate_payments", "coordinates"
  add_foreign_key "coordinate_payments", "users"
  add_foreign_key "coordinates", "shops"
  add_foreign_key "coordinates", "users"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "images", "items"
  add_foreign_key "item_payments", "items"
  add_foreign_key "item_payments", "users"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "shops"
  add_foreign_key "items", "users"
  add_foreign_key "recommends", "communities"
  add_foreign_key "recommends", "users"
  add_foreign_key "stylists", "shops"
  add_foreign_key "stylists", "users"
  add_foreign_key "talks", "communities"
  add_foreign_key "talks", "users"
end
