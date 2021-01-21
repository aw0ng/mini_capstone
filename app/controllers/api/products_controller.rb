class Api::ProductsController < ApplicationController
  def index
    @products = Product
      .name_search(params[:search])
      .discounted(params[:discount])
      .sorted(params[:sort], params[:sort_order])
    render "index.json.jb"
  end
    # @products = Product.all
    
    # @products = Product.where("name ILIKE '%sony%'")
    # @products = Product.all.order(:price)
    # @products = Product.all.order(:price => :desc)

    # if params[:search]
    #   @products = @products.where("name ILIKE ?", "%#{params[:search]}%")
    # end

    # if params[:sort] && params[:sort_order]
    #   @products = @products.order("price #{params[:sort_order]}")
    # else params[:sort] == []
    #      @products = @products.order(:id)
    # end
    
    # if params[:discount] == "true"
    #   @products = @products.where("price < ?", 2000)
    # end

    # if params[:sort] == "price" && params[:sort_order] == "asc"
    #   @products = @products.order(price: :asc)
    # elsif params[:sort] == "price" && params[:sort_order] == "desc"
    #   @products = @products.order(price: :desc)
    # else
    #   @products = @products.order(id: :asc)
    # end

    # if params[:discount] == true
    #   @products = @products.where(discounted: true)
    # end

    # if params[:discount]
    #   @products = @products.where("discount #{params[discounted: true]}")
    # end

  def show
    @product = Product.find_by(id: params["id"])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    if @product.save
      render 'show.json.jb'
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.save
    if @product.save
      render 'show.json.jb'
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params[:id]) #do not need instance, not viewing
    product.destroy #do not need @ to create instance, not viewing
    render json: {message: 'product destroyed'}
  end
end
