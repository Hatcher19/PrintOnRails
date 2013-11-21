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

ActiveRecord::Schema.define(:version => 20131121001341) do

  create_table "abilities", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "accounts", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "company"
    t.integer  "admin_user_id"
    t.string   "subdomain"
  end

  add_index "accounts", ["admin_user_id"], :name => "index_accounts_on_admin_user_id"

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["owner_id", "owner_type"], :name => "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], :name => "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], :name => "index_activities_on_trackable_id_and_trackable_type"

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "customer_id"
    t.string   "zip"
    t.string   "address_name"
    t.boolean  "same_as_billing"
    t.string   "address_type"
  end

  add_index "addresses", ["address_type"], :name => "index_addresses_on_address_type"
  add_index "addresses", ["customer_id"], :name => "index_addresses_on_customer_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "phone"
    t.string   "role"
    t.integer  "account_id"
    t.string   "first"
    t.string   "last"
    t.string   "phone_number"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "art_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "arts", :force => true do |t|
    t.string   "artwork"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "order_id"
  end

  add_index "arts", ["order_id"], :name => "index_arts_on_order_id"

  create_table "artworks", :force => true do |t|
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "location"
    t.string   "file"
    t.string   "color"
  end

  add_index "artworks", ["file"], :name => "index_artworks_on_file"
  add_index "artworks", ["order_id"], :name => "index_artworks_on_order_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "company"
    t.integer  "admin_user_id"
    t.integer  "account_id"
    t.string   "street"
    t.string   "unit"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "outside"
  end

  add_index "customers", ["account_id"], :name => "index_customers_on_account_id"
  add_index "customers", ["admin_user_id"], :name => "index_customers_on_admin_user_id"

  create_table "line_items", :force => true do |t|
    t.integer  "quantity"
    t.string   "style"
    t.string   "color"
    t.integer  "s"
    t.integer  "m"
    t.integer  "l"
    t.integer  "xl"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "order_id"
    t.integer  "yxs"
    t.integer  "ys"
    t.integer  "ym"
    t.integer  "yl"
    t.integer  "yxl"
    t.integer  "xs"
    t.integer  "xxl"
    t.integer  "xxxl"
    t.integer  "xxxxl"
    t.string   "size"
  end

  create_table "only_admins", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "only_admins_authorizations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "account_id"
  end

  add_index "order_categories", ["account_id"], :name => "index_order_categories_on_account_id"

  create_table "order_priorities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "weight"
  end

  add_index "order_priorities", ["weight"], :name => "index_order_priorities_on_weight"

  create_table "order_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "active"
  end

  create_table "order_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.date     "end_date"
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "customer_id"
    t.integer  "order_category_id"
    t.integer  "order_type_id"
    t.integer  "order_status_id"
    t.integer  "admin_user_id"
    t.boolean  "ship"
    t.integer  "product_status_id"
    t.integer  "account_id"
    t.integer  "art_status_id"
  end

  add_index "orders", ["account_id"], :name => "index_orders_on_account_id"
  add_index "orders", ["admin_user_id"], :name => "index_orders_on_admin_user_id"
  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["order_category_id"], :name => "index_orders_on_order_category_id"
  add_index "orders", ["product_status_id"], :name => "index_orders_on_product_status_id"

  create_table "print_locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "active"
  end

  create_table "sizes", :force => true do |t|
    t.string   "size"
    t.integer  "line_item_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "quantity"
  end

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
