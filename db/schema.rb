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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150428125423) do

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "mail"
    t.string   "login"
    t.string   "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
ActiveRecord::Schema.define(version: 20150428125900) do

  create_table "annonces", force: :cascade do |t|
    t.string   "titre"
    t.string   "typeProduit"
    t.integer  "prixMini"
    t.integer  "prixMaxi"
    t.string   "region"
    t.integer  "codePostal"
    t.datetime "dateLastAnnonce"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
>>>>>>> 1fc9510a4fe49ff690a1456de63da34b14722524
  end

end
