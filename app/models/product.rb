class Product < ApplicationRecord
  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax #accounts for tax rate changing
  end
end