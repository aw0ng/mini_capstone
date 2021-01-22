class Image < ApplicationRecord
  # belongs_to :product
  def product
    # Look in the product's table for a product with an id that matches image_id
    Product.find_by(id: image_id)
  end
end
