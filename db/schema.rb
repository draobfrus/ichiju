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

ActiveRecord::Schema[7.0].define(version: 2023_04_17_105002) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "user_id"], name: "index_bookmarks_on_post_id_and_user_id", unique: true
    t.index ["post_id"], name: "index_bookmarks_on_post_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "classification", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "user_id"], name: "index_likes_on_post_id_and_user_id", unique: true
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "misosoup_bases", force: :cascade do |t|
    t.integer "type"
    t.string "item_name"
    t.integer "item_price"
    t.string "item_url"
    t.string "item_image_urls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_code"
    t.index ["item_code"], name: "index_misosoup_bases_on_item_code", unique: true
  end

  create_table "post_ingredients", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_post_ingredients_on_ingredient_id"
    t.index ["post_id", "ingredient_id"], name: "index_post_ingredients_on_post_id_and_ingredient_id", unique: true
    t.index ["post_id"], name: "index_post_ingredients_on_post_id"
  end

  create_table "post_misosoup_bases", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "misosoup_base_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["misosoup_base_id"], name: "index_post_misosoup_bases_on_misosoup_base_id"
    t.index ["post_id", "misosoup_base_id"], name: "index_post_misosoup_bases_on_post_id_and_misosoup_base_id", unique: true
    t.index ["post_id"], name: "index_post_misosoup_bases_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.string "image", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_misosoup_bases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "misosoup_base_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["misosoup_base_id"], name: "index_user_misosoup_bases_on_misosoup_base_id"
    t.index ["user_id", "misosoup_base_id"], name: "index_user_misosoup_bases_on_user_id_and_misosoup_base_id", unique: true
    t.index ["user_id"], name: "index_user_misosoup_bases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255, null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "avatar"
    t.integer "birthplace_code"
    t.integer "living_place_code"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookmarks", "posts"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "post_ingredients", "ingredients"
  add_foreign_key "post_ingredients", "posts"
  add_foreign_key "post_misosoup_bases", "misosoup_bases"
  add_foreign_key "post_misosoup_bases", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "user_misosoup_bases", "misosoup_bases"
  add_foreign_key "user_misosoup_bases", "users"
end
