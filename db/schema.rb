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

ActiveRecord::Schema[7.0].define(version: 2024_05_11_225647) do
  create_table "authors", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "titre"
    t.string "document_type"
    t.string "author"
  end

  create_table "emprunts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "document_id"
    t.integer "ordinateur_id"
    t.date "date_emprunt"
    t.date "date_retour"
    t.index ["document_id"], name: "index_emprunts_on_document_id"
    t.index ["ordinateur_id"], name: "index_emprunts_on_ordinateur_id"
    t.index ["user_id"], name: "index_emprunts_on_user_id"
  end

  create_table "ordinateurs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "marque"
    t.string "modele"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
  end

  add_foreign_key "emprunts", "documents"
  add_foreign_key "emprunts", "ordinateurs"
  add_foreign_key "emprunts", "users"
end
