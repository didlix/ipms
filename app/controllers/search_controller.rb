class SearchController < ApplicationController
  
  layout 'page'
  
  def index
  end
  
  auto_complete_for :feed_product, :manufacturer_code
  
end
