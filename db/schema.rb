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

ActiveRecord::Schema.define(version: 2022_01_27_021025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.string "street"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone"
    t.string "email"
    t.string "whatsapp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string "description"
    t.string "title"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_contents_on_profile_id"
  end

  create_table "hours", force: :cascade do |t|
    t.time "init"
    t.time "final"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.json "audits", default: [], array: true
    t.boolean "logged", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_logins_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "fullname"
    t.string "slug_name"
    t.integer "age"
    t.string "description"
    t.string "document"
    t.bigint "user_id", null: false
    t.bigint "service_id"
    t.bigint "hour_id"
    t.bigint "verification_id"
    t.bigint "contact_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_profiles_on_contact_id"
    t.index ["hour_id"], name: "index_profiles_on_hour_id"
    t.index ["service_id"], name: "index_profiles_on_service_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
    t.index ["verification_id"], name: "index_profiles_on_verification_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "types", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "confirm_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "verifications", force: :cascade do |t|
    t.boolean "valid", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "users"
  add_foreign_key "contents", "profiles"
  add_foreign_key "logins", "users"
  add_foreign_key "profiles", "contacts"
  add_foreign_key "profiles", "hours"
  add_foreign_key "profiles", "services"
  add_foreign_key "profiles", "users"
  add_foreign_key "profiles", "verifications"
end
