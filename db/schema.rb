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

ActiveRecord::Schema.define(:version => 20130511183353) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lots", :force => true do |t|
    t.string   "name"
    t.decimal  "start_price",                  :precision => 10, :scale => 0
    t.date     "contract_delivery_date"
    t.integer  "tender_id"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
    t.string   "contract"
    t.integer  "order_number"
    t.string   "tz_file"
    t.string   "initial_price_reasoning_file"
    t.string   "other_documents_file"
    t.text     "initial_price_description"
    t.text     "participant_demands"
    t.text     "subcontractor_demands"
    t.boolean  "application_pledge"
    t.decimal  "application_pledge_percent",   :precision => 10, :scale => 0
    t.decimal  "application_pledge_sum",       :precision => 10, :scale => 0
    t.text     "application_pledge_form"
    t.boolean  "contract_pledge"
    t.decimal  "contract_pledge_percent",      :precision => 10, :scale => 0
    t.decimal  "contract_pledge_sum",          :precision => 10, :scale => 0
    t.text     "contract_pledge_form"
  end

  add_index "lots", ["tender_id"], :name => "index_lots_on_tender_id"

  create_table "measures", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_types", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "productions", :force => true do |t|
    t.integer  "product_type_id"
    t.integer  "lot_id"
    t.boolean  "is_electronic"
    t.integer  "quantity"
    t.integer  "measure_id"
    t.decimal  "price",           :precision => 10, :scale => 0
    t.integer  "order_number"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "productions", ["lot_id"], :name => "index_productions_on_lot_id"
  add_index "productions", ["measure_id"], :name => "index_productions_on_measure_id"
  add_index "productions", ["product_type_id"], :name => "index_productions_on_product_type_id"

  create_table "tender_states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tender_types", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tenders", :force => true do |t|
    t.string   "name"
    t.integer  "registry_number"
    t.date     "placing_date"
    t.date     "start_app_date"
    t.date     "end_app_date"
    t.string   "app_place"
    t.string   "app_order"
    t.date     "app_open_date"
    t.string   "app_open_place"
    t.date     "app_view_date"
    t.string   "app_view_place"
    t.date     "doc_begin_date"
    t.date     "doc_end_date"
    t.string   "doc_place"
    t.string   "doc_order"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "tender_type_id"
    t.integer  "tender_state_id"
    t.integer  "customer_id"
    t.decimal  "price",           :precision => 10, :scale => 0
  end

  add_index "tenders", ["customer_id"], :name => "index_tenders_on_customer_id"
  add_index "tenders", ["tender_state_id"], :name => "index_tenders_on_tender_state_id"
  add_index "tenders", ["tender_type_id"], :name => "index_tenders_on_tender_type_id"

end
