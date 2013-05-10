class FeedMapsController < ApplicationController
  layout 'page'
  
  def index
    
  end
  
  
  def show
    @feed_map =  FeedMap.find_by_id(params[:id])
    @data = @feed_map.feed.get_sample_data
  end
  
  def show_by_feed_id
    @feed_map =  FeedMap.find_by_feed_id(params[:id])
    unless @feed_map
      flash[:notice] = 'No Feed Maps Created, Please make some'
      redirect_to( :action => 'new', :id => params[:id] )
    end    
  end
  
  # test action to process a feed
  def make_it_so
    @feed_map = FeedMap.find(params[:id])
    @feed_map.feed.to_products
  end
  
  def new
      @feed_map = FeedMap.new
      @data = Feed.find(params[:id]).get_sample_data
      @feed_id = params[:id]
  end
  
  def edit
    @feed_map = FeedMap.find(params[:id])
    @data = @feed_map.feed.get_sample_data 
    @feed_id = params[:id]    
  end
  
  def update
    @feed_map = FeedMap.find(params[:id])    

    respond_to do |format|
      if @feed_map.update_attributes(params[:feed_map])
        flash[:notice] = 'Feed Map was successfully updated.'
        format.html { redirect_to(@feed_map) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feed_map.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def create
    @feed_map = FeedMap.new(params[:feed_map])    
    @data = @feed_map.feed.get_sample_data
    respond_to do |format|
      if @feed_map.save
        flash[:notice] = 'Feed Map was successfully created.'
        format.html { redirect_to(@feed_map) }
        format.xml  { render :xml => @feed_map, :status => :created, :location => @feed_map }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @feed_map.errors, :status => :unprocessable_entity }
      end
    end    
    
  end
  
  def destroy
  end
  

end