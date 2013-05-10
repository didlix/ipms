class Supplier < ActiveRecord::Base
  has_many :feeds
  has_many :feed_products
  
  validates_format_of :email,
                      :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :message => "Please supply a valid email address"
end
