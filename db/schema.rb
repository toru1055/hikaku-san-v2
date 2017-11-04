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

ActiveRecord::Schema.define(version: 20171104112811) do

  create_table "columns", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "priority"
    t.integer "type_id"
    t.integer "table_id"
    t.boolean "not_null"
    t.boolean "unique"
    t.string "default_value"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_id"], name: "index_columns_on_table_id"
    t.index ["type_id"], name: "index_columns_on_type_id"
  end

  create_table "elements", force: :cascade do |t|
    t.integer "table_id"
    t.integer "item_id"
    t.integer "column_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_elements_on_column_id"
    t.index ["item_id"], name: "index_elements_on_item_id"
    t.index ["table_id"], name: "index_elements_on_table_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "description"
    t.integer "price"
    t.text "main_image"
    t.integer "table_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "rakuten_url"
    t.index ["table_id"], name: "index_items_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "hero_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.text "annotation"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
