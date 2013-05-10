class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :title
      t.text :url
      t.integer :suppliers_id
      t.timestamp :last_downloaded
      t.integer :download_status
      t.timestamp :last_run

      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
