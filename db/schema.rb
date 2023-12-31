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

ActiveRecord::Schema.define(version: 2023_08_31_120941) do

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "tags_todo_lists", id: false, force: :cascade do |t|
    t.integer "todo_list_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "content"
    t.integer "list_id"
    t.index ["list_id"], name: "index_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "color_theme"
  end

end
