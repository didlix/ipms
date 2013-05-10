class AddSupplierIdToFeeds < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :suppliers_id, :supplier_id
  end

  def self.down
    rename_column :feeds, :supplier_id, :suppliers_id
  end
end
