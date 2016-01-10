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

ActiveRecord::Schema.define(version: 20160108082902) do

  create_table "answers", force: :cascade do |t|
    t.boolean  "correct"
    t.string   "answer_body"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.boolean  "alive"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "max_challenge_time"
    t.datetime "latest_end"
    t.boolean  "strict_order"
    t.integer  "strikes"
  end

  create_table "elements", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "question_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "elements", ["challenge_id"], name: "index_elements_on_challenge_id"
  add_index "elements", ["question_id"], name: "index_elements_on_question_id"

  create_table "feeders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "feeders", ["user_id"], name: "index_feeders_on_user_id"

  create_table "feeds", force: :cascade do |t|
    t.integer  "priority"
    t.integer  "feeder_id"
    t.integer  "question_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "challenge_id"
    t.integer  "participation_id"
  end

  add_index "feeds", ["challenge_id"], name: "index_feeds_on_challenge_id"
  add_index "feeds", ["feeder_id"], name: "index_feeds_on_feeder_id"
  add_index "feeds", ["participation_id"], name: "index_feeds_on_participation_id"
  add_index "feeds", ["question_id"], name: "index_feeds_on_question_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

  create_table "participations", force: :cascade do |t|
    t.boolean  "complete"
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "succeeded"
    t.integer  "strikes"
  end

  add_index "participations", ["challenge_id"], name: "index_participations_on_challenge_id"
  add_index "participations", ["user_id"], name: "index_participations_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.string   "problem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repleys", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "points"
  end

  add_index "repleys", ["answer_id"], name: "index_repleys_on_answer_id"
  add_index "repleys", ["question_id"], name: "index_repleys_on_question_id"
  add_index "repleys", ["user_id"], name: "index_repleys_on_user_id"

  create_table "selections", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "feeder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "selections", ["feeder_id"], name: "index_selections_on_feeder_id"
  add_index "selections", ["tag_id"], name: "index_selections_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ties", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ties", ["question_id"], name: "index_ties_on_question_id"
  add_index "ties", ["tag_id"], name: "index_ties_on_tag_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
