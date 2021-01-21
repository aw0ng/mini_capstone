class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0}
  validates :description, length: { minimum: 2, maximum: 500}
  validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "must have a valid file type", multiline: true

  scope :name_search, ->(search_terms) do
    if search_terms
      where("name ILIKE ?", "%#{search_terms}%")
    end
  end

scope :discounted, ->(check_discount) do
    if check_discount
      where("price < ?", 2000)
    end
  end

scope :sorted, ->(sort, sort_order) do
    if sort == "price" && sort_order == "asc"
      order(price: :asc)
    elsif sort == "price" && sort_order == "desc"
      order(price: :desc)
    else
      order(id: :asc)
    end
  end

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