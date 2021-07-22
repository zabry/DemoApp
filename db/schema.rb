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

ActiveRecord::Schema.define(version: 2021_07_22_045959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempt_answers", force: :cascade do |t|
    t.bigint "attempt_id", null: false
    t.bigint "test_question_id", null: false
    t.string "user_answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attempt_id"], name: "index_attempt_answers_on_attempt_id"
    t.index ["test_question_id"], name: "index_attempt_answers_on_test_question_id"
  end

  create_table "attempts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "test_module_id", null: false
    t.float "score"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["test_module_id"], name: "index_attempts_on_test_module_id"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.bigint "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_chapters_on_subject_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.bigint "board_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_classrooms_on_board_id"
  end

  create_table "reposoitories", force: :cascade do |t|
    t.string "name"
    t.bigint "chapter_id", null: false
    t.string "filepath"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_reposoitories_on_chapter_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_subjects_on_classroom_id"
  end

  create_table "test_modules", force: :cascade do |t|
    t.string "name"
    t.bigint "chapter_id", null: false
    t.float "time_taken"
    t.integer "no_of_qns"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chapter_id"], name: "index_test_modules_on_chapter_id"
  end

  create_table "test_questions", force: :cascade do |t|
    t.bigint "test_module_id", null: false
    t.string "question"
    t.string "choice1"
    t.string "choice2"
    t.string "choice3"
    t.string "choice4"
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["test_module_id"], name: "index_test_questions_on_test_module_id"
  end

  create_table "user_repo_progresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "reposoitory_id", null: false
    t.float "progress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reposoitory_id"], name: "index_user_repo_progresses_on_reposoitory_id"
    t.index ["user_id"], name: "index_user_repo_progresses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "mobile"
    t.date "dob"
    t.bigint "board_id"
    t.bigint "classroom_id"
    t.integer "one_time_password"
    t.datetime "otp_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.datetime "token_expiration"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["board_id"], name: "index_users_on_board_id"
    t.index ["classroom_id"], name: "index_users_on_classroom_id"
  end

  add_foreign_key "attempt_answers", "attempts"
  add_foreign_key "attempt_answers", "test_questions"
  add_foreign_key "attempts", "test_modules"
  add_foreign_key "attempts", "users"
  add_foreign_key "chapters", "subjects"
  add_foreign_key "classrooms", "boards"
  add_foreign_key "reposoitories", "chapters"
  add_foreign_key "subjects", "classrooms"
  add_foreign_key "test_modules", "chapters"
  add_foreign_key "test_questions", "test_modules"
  add_foreign_key "user_repo_progresses", "reposoitories"
  add_foreign_key "user_repo_progresses", "users"
  add_foreign_key "users", "boards"
  add_foreign_key "users", "classrooms"
end
