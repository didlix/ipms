class UniqueFeedId < ActiveRecord::Migration
  def self.up
    add_index :feed_maps, :feed_id
  end

  def self.down
    add_index :feed_maps, :feed_id
  end
end
