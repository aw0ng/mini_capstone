class Supplier < ApplicationRecord
  # has_many :products
  def products
    # Look in the product's table for all the products with a supplier_id that matches id
    Product.where(supplier_id: id)
  end
end