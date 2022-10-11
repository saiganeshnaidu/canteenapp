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

ActiveRecord::Schema[7.0].define(version: 2022_10_11_112656) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.integer "quantity", default: 1, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_item_id", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["food_item_id"], name: "index_cart_items_on_food_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "order_status", default: "Placed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_store_id", null: false
    t.index ["food_store_id"], name: "index_carts_on_food_store_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "chefprofiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.bigint "user_id", null: false
    t.boolean "isapproved", default: false
    t.boolean "isrejected", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_store_id", null: false
    t.index ["food_store_id"], name: "index_chefprofiles_on_food_store_id"
    t.index ["user_id"], name: "index_chefprofiles_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_profiles", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.boolean "isapproved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isrejected"
    t.index ["company_id"], name: "index_employee_profiles_on_company_id"
    t.index ["user_id"], name: "index_employee_profiles_on_user_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_store_id", null: false
    t.index ["food_store_id"], name: "index_food_items_on_food_store_id"
  end

  create_table "food_stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_category_id", null: false
    t.index ["food_category_id"], name: "index_food_stores_on_food_category_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.text "context"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "normal_customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.bigint "user_id", null: false
    t.boolean "isapproved", default: false
    t.boolean "isrejected", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_normal_customers_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
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
    t.string "uid"
    t.string "provider"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "food_items"
  add_foreign_key "carts", "food_stores"
  add_foreign_key "carts", "users"
  add_foreign_key "chefprofiles", "food_stores"
  add_foreign_key "chefprofiles", "users"
  add_foreign_key "employee_profiles", "companies"
  add_foreign_key "employee_profiles", "users"
  add_foreign_key "food_items", "food_stores"
  add_foreign_key "food_stores", "food_categories"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "normal_customers", "users"
  add_foreign_key "rooms", "carts"
end
