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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121105064435) do

  create_table "categories", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id",             :default => 0, :null => false
    t.string   "title",                              :null => false
    t.text     "content",                            :null => false
    t.integer  "hits_count",          :default => 0, :null => false
    t.integer  "comment_count",       :default => 0, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.string   "asset2_file_name"
    t.string   "asset2_content_type"
    t.integer  "asset2_file_size"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                      :null => false
    t.string   "password",                   :null => false
    t.string   "name",                       :null => false
    t.string   "salt",                       :null => false
    t.integer  "level",      :default => 10, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

end
