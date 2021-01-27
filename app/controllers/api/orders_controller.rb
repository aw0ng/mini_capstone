class Api::OrdersController < ApplicationController
  def index
    # @orders = Order.where(user_id: current_user.id)
    if current_user
      @orders = current_user.orders
      render "index.json.jb"
    else
      render json: [], status: :unauthorized
    end
  end
  
  def show
    if current_user
      @order = current_user.orders.find_by(id: params[:id])
      render "show.json.jb"
    # @order = Order.find_by(id: params[:id])
    # if @order.user_id == current_user.id
    #   render "show.json.jb"
    # else
    #   render json: { message: "You must be logged in to see your orders."}
    # end
    else
      render json: [], status: :unauthorized
    end
  end
  
  def create
    if current_user
      product = Product.find_by(id: params[:product_id])
      calculated_subtotal = product.price * params[:quantity].to_i
      calculated_tax = calculated_subtotal * 0.09
    # create tax variable to store tax rate separately
      calculated_total = calculated_subtotal + calculated_tax

      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total
        )
      @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: 422
    end
  end
end
