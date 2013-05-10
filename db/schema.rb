# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091209115304) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feed_maps", :force => true do |t|
    t.integer  "feed_id"
    t.integer  "supplier_id"
    t.integer  "manufacturer_code"
    t.integer  "supplier_code"
    t.integer  "brand_id"
    t.integer  "product_name"
    t.integer  "description"
    t.integer  "weight"
    t.integer  "dimensions"
    t.integer  "images"
    t.integer  "stock"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feed_maps", ["feed_id"], :name => "index_feed_maps_on_feed_id"

  create_table "feed_products", :force => true do |t|
    t.integer  "feed_id"
    t.string   "manufacturer_code"
    t.string   "supplier_code"
    t.integer  "brand_id"
    t.string   "product_name"
    t.text     "description"
    t.string   "weight"
    t.string   "dimensions"
    t.string   "images"
    t.integer  "stock"
    t.decimal  "price",             :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "feeds", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "supplier_id"
    t.datetime "last_downloaded"
    t.integer  "download_status"
    t.datetime "last_run"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_maps", :force => true do |t|
    t.string   "product_manufacturer_code"
    t.string   "feed_product_manufacturer_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "feed_id"
    t.string   "manufacturer_code"
    t.string   "supplier_code"
    t.integer  "brand_id"
    t.string   "product_name"
    t.text     "description"
    t.string   "weight"
    t.string   "dimensions"
    t.string   "images"
    t.integer  "stock"
    t.decimal  "price",             :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "company"
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
