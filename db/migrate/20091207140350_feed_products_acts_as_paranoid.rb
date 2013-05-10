class FeedProductsActsAsParanoid < ActiveRecord::Migration
  def self.up
    add_column :feed_products, :deleted_at, :datetime
  end

  def self.down
    remove_column :feed_products, :deleted_at
  end
end
