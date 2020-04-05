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

ActiveRecord::Schema.define(version: 20200405204931) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "cart_id"
    t.decimal "price", precision: 8, scale: 2
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["order_id"], name: "index_cart_items_on_order_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "status", default: "waiting_for_payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer "account_number"
    t.bigint "issuing_bank"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payment_details_on_order_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer "order_id"
    t.string "name"
    t.string "street"
    t.integer "zip_code"
    t.string "country"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_shipping_addresses_on_order_id"
  end

end
