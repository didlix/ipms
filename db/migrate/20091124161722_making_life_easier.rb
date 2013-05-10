class MakingLifeEasier < ActiveRecord::Migration
  def self.up
    drop_table :feed_maps
    create_table :feed_maps do |t|
      t.integer   :feed_id
      t.integer   :supplier_id
      t.integer   :manufacturer_code
      t.integer   :supplier_code
      t.integer   :brand_id
      t.integer   :product_name
      t.integer   :description
      t.integer   :weight
      t.integer   :dimensions
      t.integer   :images
      t.integer   :stock
      t.integer   :price
      t.timestamps
    end
  end

  def self.down
    drop_table :feed_maps
  end
end
