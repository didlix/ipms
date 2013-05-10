class RemoveSupplierIdFromProduct < ActiveRecord::Migration
  def self.up
    remove_column :products, :supplier_id
    remove_column :feed_products, :supplier_id
  end

  def self.down
    add_column :products, :supplier_id, :integer
    add_column :feed_products, :supplier_id, :integer
  end
end
