class FeedProductsController < ApplicationController
  
  layout 'page'
  
  def index
      @feed_products = FeedProduct.paginate :page => params[:page], :group => 'manufacturer_code'
  end
  
  def show
    @feed_product = FeedProduct.find(params[:id])
    @feed_products = FeedProduct.find_all_by_manufacturer_code(@feed_product.manufacturer_code)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feed }
    end    
  end
  
  def new
  end
  
  
end
