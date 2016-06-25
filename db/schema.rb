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

ActiveRecord::Schema.define(version: 20150417001553) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "information", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.float    "price",       limit: 24
    t.text     "description", limit: 65535
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "information_users", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "information_id", limit: 4
    t.boolean  "status",         limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "majors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.float    "price",       limit: 24
    t.text     "description", limit: 65535
    t.boolean  "status",      limit: 1
    t.string   "avatar",      limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "user_products", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "email",           limit: 255
    t.boolean  "gender",          limit: 1
    t.string   "phone",           limit: 255
    t.string   "address",         limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "status",          limit: 1
    t.boolean  "email_status",    limit: 1
    t.boolean  "info_status",     limit: 1
    t.integer  "major_id",        limit: 4
    t.integer  "grade_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar",          limit: 255
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
