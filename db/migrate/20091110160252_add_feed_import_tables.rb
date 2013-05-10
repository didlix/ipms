class AddFeedImportTables < ActiveRecord::Migration
  def self.up

    create_table :feed_maps do |t|
      t.integer :feed_id
      t.string  :my_column #populate with list of columns in products table
      t.string  :their_column
      t.timestamps
    end    
    
    create_table :brands do |t|
      t.string      :name
      t.text        :description
      t.timestamps
    end

    create_table :products do |t|
      t.integer   :feed_id
      t.integer   :supplier_id
      t.string    :manufacturer_code
      t.string    :supplier_code
      t.integer   :brand_id
      t.string    :product_name
      t.text      :description
      t.string    :weight
      t.string    :dimensions
      t.string    :images
      t.integer   :stock
      t.decimal   :price, :scale=>2, :default=>0, :precision=>8
      t.timestamps
    end

  end

  def self.down
  end
end
