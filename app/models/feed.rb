class Feed < ActiveRecord::Base
  belongs_to :supplier
  has_one :feed_map
  
  def get_headings
       download.first
  end

  # return some sample data to the user
  def get_sample_data
       data = download.first
       data_hash = Hash.new
       data.each_with_index do |item, index|
          data_hash[item] = index
       end
       data_hash
  end
  
  def to_products
  
   import_data = download
      
   FeedProduct.destroy_all(:feed_id => self.id)
     
   import_data.each do |row|
     
     this_product = Hash.new
     this_product[:product_name]      = row[feed_map.product_name] unless feed_map.product_name.nil? or row[feed_map.product_name].nil?
     this_product[:price]             = row[feed_map.price] unless feed_map.price.nil? or row[feed_map.price].nil?
     this_product[:description]       = row[feed_map.description] unless feed_map.description.nil? or row[feed_map.description].nil? 
     this_product[:manufacturer_code] = row[feed_map.manufacturer_code] unless row[feed_map.manufacturer_code].nil?
     this_product[:weight]            = row[feed_map.weight] unless feed_map.weight.nil? or row[feed_map.weight].nil?
     this_product[:dimensions]        = row[feed_map.dimensions] unless feed_map.dimensions.nil? or row[feed_map.dimensions].nil?
     this_product[:images]            = row[feed_map.images] unless feed_map.images.nil? or row[feed_map.images].nil?
     this_product[:stock]             = row[feed_map.stock] unless feed_map.stock.nil? or row[feed_map.stock].nil?
     this_product[:supplier_code]     = row[feed_map.supplier_code] unless feed_map.supplier_code.nil? or row[feed_map.supplier_code].nil?
     this_product[:feed_id]           = self.id
     
     Product.find_by_manufacturer_code(row[feed_map.manufacturer_code]) || Product.create(this_product)
     FeedProduct.create(this_product)
     end
     
     this_dir = "#{RAILS_ROOT}/public"
     t = Thread.new { `#{this_dir}/play #{this_dir}/makeso.wav` }
     t.run
     t.join
     true
  end
  
  # Get feeds that need updating and process them
  def self.process_feeds
    #Feed.all {:conditions => 'last_checked + check_interval <= NOW()'}.each do |feed|
    Feed.all.each do |feed|
        feed.download
    end
  end

  # Test that a uri can be opened
  def url_must_open
      file = URI.parse(url).open
  end 

  # Download a feed to a tempoary file and pump it back as an array
  def download
      require 'tempfile'
      require 'open-uri'
      require 'faster_csv'

      temp_file = Tempfile.new('download_','tmp')
      temp_file.write(open(url).read) 
      temp_file.flush

      begin
        arr = FasterCSV.read(temp_file.path, :encoding => 'u')

      end
      temp_file.close!
      arr
  end
  
  
  
  protected 
    # Make sure a uri is valid
    def url_must_be_a_real_uri
      begin
        uri = URI.parse(url)
        if(uri.class == URI::Generic)
          errors.add(:url, 'should be a valid url')
        end
      rescue URI::InvalidURIError     
        errors.add(:url, 'should be a valid url')
      end
    end

    
    
  validates_numericality_of :supplier_id
  validates_presence_of :title, :url, :supplier_id
  validates_uniqueness_of :title
  validate :url_must_be_a_real_uri

end