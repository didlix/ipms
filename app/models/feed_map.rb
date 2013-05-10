class FeedMap < ActiveRecord::Base
  belongs_to :feed
  validates_presence_of :feed_id
  validates_uniqueness_of :feed_id
end
