class ProductsController < ApplicationController
  
  layout 'page'
  
  def index
      @products = Product.paginate :page => params[:page]
  end
  
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @feed }
    end    
  end
  
end
