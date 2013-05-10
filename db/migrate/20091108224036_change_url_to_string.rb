class ChangeUrlToString < ActiveRecord::Migration
  def self.up
    change_column :feeds, :url, :string
  end

  def self.down
    change_column :feeds, :url, :text
  end
end
