class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      status: "Carted",
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    @carted_product.save
    render "show.json.jb"
  end

  def index
    @carted_products = current_user.carted_products.where(status: "Carted")
    render "index.json.jb"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "Removed"
    carted_product.save
    render json: { message: "Carted product successfully removed!" }
  end
end
