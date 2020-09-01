# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_14_234753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gym_classes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "duration"
    t.integer "max_size"
    t.integer "gym_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gym_id"], name: "index_gym_classes_on_gym_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "provider_name"
    t.boolean "using_provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.integer "gym_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gym_id"], name: "index_members_on_gym_id"
  end

  create_table "scheduled_classes", force: :cascade do |t|
    t.datetime "time"
    t.integer "member_id"
    t.integer "gym_id", null: false
    t.integer "gym_class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gym_class_id"], name: "index_scheduled_classes_on_gym_class_id"
    t.index ["gym_id"], name: "index_scheduled_classes_on_gym_id"
    t.index ["member_id"], name: "index_scheduled_classes_on_member_id"
  end

  add_foreign_key "gym_classes", "gyms"
  add_foreign_key "members", "gyms"
  add_foreign_key "scheduled_classes", "gym_classes"
  add_foreign_key "scheduled_classes", "gyms"
  add_foreign_key "scheduled_classes", "members"
end
