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

ActiveRecord::Schema.define(version: 2019_05_04_163758) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "approvals", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_approvals_on_post_id"
    t.index ["user_id"], name: "index_approvals_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "description"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "professor"
  end

  create_table "courses_degrees", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "degree_id"
    t.index ["course_id"], name: "index_courses_degrees_on_course_id"
    t.index ["degree_id"], name: "index_courses_degrees_on_degree_id"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
    t.index ["course_id"], name: "index_courses_users_on_course_id"
    t.index ["user_id"], name: "index_courses_users_on_user_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_degrees_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "message_board_id"
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_documents_on_category_id"
    t.index ["message_board_id"], name: "index_documents_on_message_board_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "appointment"
    t.string "place"
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_events_on_group_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.integer "message_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_board_id"], name: "index_groups_on_message_board_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "membership"
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id", "group_id"], name: "index_members_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "message_boards", force: :cascade do |t|
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_message_boards_on_course_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "role"
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["user_id", "event_id"], name: "index_participants_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "description"
    t.integer "user_id"
    t.integer "message_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_board_id"], name: "index_posts_on_message_board_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "posts_users", id: false, force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.index ["post_id"], name: "index_posts_users_on_post_id"
    t.index ["user_id"], name: "index_posts_users_on_user_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "grade"
    t.integer "user_id"
    t.integer "message_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_board_id"], name: "index_rates_on_message_board_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "feedback"
    t.integer "user_id"
    t.integer "message_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_board_id"], name: "index_reviews_on_message_board_id"
    t.index ["user_id", "message_board_id"], name: "index_reviews_on_user_id_and_message_board_id", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.date "birthday"
    t.string "address"
    t.string "serial_number"
    t.boolean "admin"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.string "single_access_token"
    t.string "perishable_token"
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perishable_token"], name: "index_users_on_perishable_token", unique: true
    t.index ["persistence_token"], name: "index_users_on_persistence_token", unique: true
    t.index ["single_access_token"], name: "index_users_on_single_access_token", unique: true
  end

end
