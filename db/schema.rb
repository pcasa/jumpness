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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120416080811) do

  create_table "bookings", :force => true do |t|
    t.integer  "inflatable_id"
    t.datetime "party_date"
    t.integer  "duration"
    t.text     "address"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "bookings", ["inflatable_id"], :name => "index_bookings_on_inflatable_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "companies", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "city",          :limit => 128
    t.string   "state",         :limit => 32
    t.string   "zipcode",       :limit => 32
    t.string   "status",        :limit => 32,  :default => "pending"
    t.string   "contact_email"
    t.text     "about"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "cached_slug"
  end

  add_index "companies", ["cached_slug"], :name => "index_companies_on_cached_slug"
  add_index "companies", ["latitude", "longitude"], :name => "add_index_to_companies_for_lat_lng"
  add_index "companies", ["user_id"], :name => "index_companies_on_user_id"

  create_table "inflatables", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.integer  "buffer_time"
    t.boolean  "is_active"
    t.float    "up_to_4_hours"
    t.float    "up_to_8_hours"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "cached_slug"
  end

  add_index "inflatables", ["cached_slug"], :name => "index_inflatables_on_cached_slug"

  create_table "phones", :force => true do |t|
    t.integer  "company_id"
    t.string   "number",     :limit => 32
    t.string   "provider",   :limit => 128
    t.string   "phone_type", :limit => 32
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "phones", ["company_id"], :name => "index_phones_on_company_id"

  create_table "photos", :force => true do |t|
    t.integer  "inflatable_id"
    t.string   "image"
    t.boolean  "primary",       :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "photos", ["inflatable_id"], :name => "index_photos_on_inflatable_id"
  add_index "photos", ["primary"], :name => "index_photos_on_primary"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "slugs", :force => true do |t|
    t.string   "scope"
    t.string   "slug"
    t.integer  "record_id"
    t.datetime "created_at"
  end

  add_index "slugs", ["scope", "record_id", "created_at"], :name => "index_slugs_on_scope_and_record_id_and_created_at"
  add_index "slugs", ["scope", "record_id"], :name => "index_slugs_on_scope_and_record_id"
  add_index "slugs", ["scope", "slug", "created_at"], :name => "index_slugs_on_scope_and_slug_and_created_at"
  add_index "slugs", ["scope", "slug"], :name => "index_slugs_on_scope_and_slug"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "",     :null => false
    t.string   "encrypted_password",                   :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                   :limit => 64, :default => "user"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role"], :name => "index_users_on_role"

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
