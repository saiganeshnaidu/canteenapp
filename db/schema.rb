# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_28_123211) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_lists", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "fooditem_id", null: false
    t.integer "quantity", default: 1
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_lists_on_cart_id"
    t.index ["fooditem_id"], name: "index_cart_lists_on_fooditem_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "foodstore_id", null: false
    t.string "order_status", default: "Placed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foodstore_id"], name: "index_carts_on_foodstore_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "chefprofiles", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.bigint "user_id", null: false
    t.bigint "foodstore_id", null: false
    t.boolean "isapproved", default: false
    t.boolean "isrejected", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foodstore_id"], name: "index_chefprofiles_on_foodstore_id"
    t.index ["user_id"], name: "index_chefprofiles_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_profiles", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.boolean "isapproved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isrejected"
    t.index ["company_id"], name: "index_employee_profiles_on_company_id"
    t.index ["user_id"], name: "index_employee_profiles_on_user_id"
  end

  create_table "foodcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fooditems", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.bigint "foodstore_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foodstore_id"], name: "index_fooditems_on_foodstore_id"
  end

  create_table "foodstores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "foodcategory_id", null: false
    t.index ["foodcategory_id"], name: "index_foodstores_on_foodcategory_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.text "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_rooms_on_cart_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "usertype"
  end

  add_foreign_key "cart_lists", "carts"
  add_foreign_key "cart_lists", "fooditems"
  add_foreign_key "carts", "foodstores"
  add_foreign_key "carts", "users"
  add_foreign_key "chefprofiles", "foodstores"
  add_foreign_key "chefprofiles", "users"
  add_foreign_key "employee_profiles", "companies"
  add_foreign_key "employee_profiles", "users"
  add_foreign_key "fooditems", "foodstores"
  add_foreign_key "foodstores", "foodcategories"
  add_foreign_key "messages", "rooms"
  add_foreign_key "rooms", "carts"
end
