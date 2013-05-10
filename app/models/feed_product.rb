class FeedProduct < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :supplier
  belongs_to :feed
end
