class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render "index.json.jb"
  end
  
  def show
    @order = current_user.orders.find_by(id: params[:id])
    render "show.json.jb"
    # @order = Order.find_by(id: params[:id])
    # if @order.user_id == current_user.id
    #   render "show.json.jb"
    # else
    #   render json: { message: "You must be logged in to see your orders."}
    # end
  end
  
  def create
    carted_products = current_user.carted_products.where(status: "Carted")
    index = 0 # make this a .each
    while index < carted_products.length
      calculated_subtotal = carted_products[index].product.price * carted_products[index].quantity
      calculated_tax = calculated_subtotal * 0.09 # create tax variable to store tax rate separately
      calculated_total = calculated_subtotal + calculated_tax
      @order = Order.new(
        user_id: current_user.id,
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total
      )
      @order.save
      carted_products.update_all(status: "Purchased", order_id: @order.id) #update all replaces loop
      index += 1
    end
    render "show.json.jb"
  end
end
