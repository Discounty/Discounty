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

ActiveRecord::Schema.define(version: 20160514120633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_campaigns", force: :cascade do |t|
    t.text     "description"
    t.integer  "shop_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ad_campaigns", ["shop_id"], name: "index_ad_campaigns_on_shop_id", using: :btree

  create_table "advertisements", force: :cascade do |t|
    t.string   "name"
    t.json     "ad_data"
    t.integer  "ad_campaign_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "content"
  end

  add_index "advertisements", ["ad_campaign_id"], name: "index_advertisements_on_ad_campaign_id", using: :btree

  create_table "barcode_types", force: :cascade do |t|
    t.string   "barcode_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "barcode_id"
  end

  add_index "barcode_types", ["barcode_id"], name: "index_barcode_types_on_barcode_id", using: :btree

  create_table "barcodes", force: :cascade do |t|
    t.string   "barcode"
    t.float    "discount_percentage"
    t.string   "extra_info"
    t.integer  "barcode_type_id"
    t.integer  "discount_card_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "barcodes", ["barcode_type_id"], name: "index_barcodes_on_barcode_type_id", using: :btree
  add_index "barcodes", ["discount_card_id"], name: "index_barcodes_on_discount_card_id", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.text     "description"
    t.integer  "barcode_id"
    t.integer  "shop_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "coupons", ["barcode_id"], name: "index_coupons_on_barcode_id", using: :btree
  add_index "coupons", ["customer_id"], name: "index_coupons_on_customer_id", using: :btree
  add_index "coupons", ["shop_id"], name: "index_coupons_on_shop_id", using: :btree

  create_table "customer_feedbacks", force: :cascade do |t|
    t.text     "feedback"
    t.integer  "rating"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "customer_feedbacks", ["customer_id"], name: "index_customer_feedbacks_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                               null: false
    t.string   "phone_number"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "customers", ["confirmation_token"], name: "index_customers_on_confirmation_token", unique: true, using: :btree
  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree

  create_table "discount_cards", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "shop_id"
    t.integer  "customer_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "unregistered_shop"
  end

  add_index "discount_cards", ["customer_id"], name: "index_discount_cards_on_customer_id", using: :btree
  add_index "discount_cards", ["shop_id"], name: "index_discount_cards_on_shop_id", using: :btree

  create_table "i18n_keys", force: :cascade do |t|
    t.string   "key_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locales", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "recipient_lists", force: :cascade do |t|
    t.integer  "ad_campaign_id"
    t.integer  "customer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "recipient_lists", ["ad_campaign_id"], name: "index_recipient_lists_on_ad_campaign_id", using: :btree
  add_index "recipient_lists", ["customer_id"], name: "index_recipient_lists_on_customer_id", using: :btree

  create_table "shop_types", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "i18n_name_id"
    t.integer  "i18n_description_id"
    t.integer  "shop_id"
  end

  add_index "shop_types", ["shop_id"], name: "index_shop_types_on_shop_id", using: :btree

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "chain_store"
    t.text     "address"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "shops", ["confirmation_token"], name: "index_shops_on_confirmation_token", unique: true, using: :btree
  add_index "shops", ["email"], name: "index_shops_on_email", unique: true, using: :btree
  add_index "shops", ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true, using: :btree
  add_index "shops", ["unlock_token"], name: "index_shops_on_unlock_token", unique: true, using: :btree

  create_table "translations", force: :cascade do |t|
    t.string   "translation"
    t.integer  "i18n_key_id"
    t.integer  "locale_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "translations", ["i18n_key_id"], name: "index_translations_on_i18n_key_id", using: :btree
  add_index "translations", ["locale_id"], name: "index_translations_on_locale_id", using: :btree

  add_foreign_key "ad_campaigns", "shops"
  add_foreign_key "advertisements", "ad_campaigns"
  add_foreign_key "barcode_types", "barcodes"
  add_foreign_key "barcodes", "barcode_types"
  add_foreign_key "barcodes", "discount_cards"
  add_foreign_key "coupons", "barcodes"
  add_foreign_key "coupons", "customers"
  add_foreign_key "coupons", "shops"
  add_foreign_key "customer_feedbacks", "customers"
  add_foreign_key "discount_cards", "customers"
  add_foreign_key "discount_cards", "shops"
  add_foreign_key "recipient_lists", "ad_campaigns"
  add_foreign_key "recipient_lists", "customers"
  add_foreign_key "shop_types", "shops"
  add_foreign_key "translations", "i18n_keys"
  add_foreign_key "translations", "locales"
end
