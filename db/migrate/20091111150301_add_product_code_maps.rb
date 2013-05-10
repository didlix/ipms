class AddProductCodeMaps < ActiveRecord::Migration
  def self.up
    create_table :product_maps do |t|
      t.string :product_manufacturer_code
      t.string  :feed_product_manufacturer_code
      t.timestamps
    end

    create_table :feed_products do |t|
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
    drop_table :feed_products
    drop_table :product_maps
  end
end
