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

ActiveRecord::Schema.define(version: 20141208151502) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "pages", force: true do |t|
    t.string "name"
    t.string "title"
    t.string "description"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_title"
    t.string   "meta_description"
  end

  create_table "replies", force: true do |t|
    t.string   "name"
    t.text     "contacts"
    t.string   "city"
    t.text     "english"
    t.string   "salary"
    t.integer  "work_type",       default: 0
    t.integer  "work_hours"
    t.integer  "vacancy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
  end

  add_index "replies", ["vacancy_id"], name: "index_replies_on_vacancy_id", using: :btree

  create_table "services", force: true do |t|
    t.string   "title"
    t.text     "header"
    t.text     "body"
    t.string   "image_url"
    t.string   "name"
    t.string   "display_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "big_image_url"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",            default: 0
  end

  create_table "vacancies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "requirements"
    t.string   "salary"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
