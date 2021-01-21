class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0}
  validates :description, length: { minimum: 2, maximum: 500}
  validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "must have a valid file type", multiline: true

  def is_discounted?
    price <= 2000
  end

  def tax
    price * 0.09
  end

  def total
    price + tax #accounts for tax rate changing
  end
end