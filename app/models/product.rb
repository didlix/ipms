class Product < ActiveRecord::Base

  def feed_products
    FeedProduct.find_all_by_manufacturer_code(self.manufacturer_code)
  end

  MAPPABLE_COLUMNS = [
    :manufacturer_code, 
    :supplier_code,
    :brand_id,
    :product_name,
    :description,
    :weight,
    :dimensions,
    :images,
    :stock,
    :price
  ]

/
  MAPPABLE_COLUMNS = [
    :manufacturer_code  => 'Manufacturer Code', 
    :supplier_code      => 'Supplier Code',
    :brand_id           => 'Brand Id',  
    :product_name       => 'Product Name',
    :description        => 'Description',
    :weight             => 'Weight',
    :dimensions         => 'Dimensions',
    :images             => 'Images',
    :stock              => 'Stock',
    :price              => 'Price'
  ]
/ 
end
