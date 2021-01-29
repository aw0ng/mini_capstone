class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      status: "Carted",
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: ""
    )
    @carted_product.save
    render "show.json.jb"
  end

  def index
    @carted_products = current_user.carted_products.where(status: "Carted")
    render "index.json.jb"
  end
end
