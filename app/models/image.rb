class Image < ApplicationRecord
  # belongs_to :products
  def image
    # Look in the product's table for a product with an id that matches image_id
    Product.find_by(id: image_id)
  end
end
