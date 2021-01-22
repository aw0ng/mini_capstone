class Api::ImagesController < ApplicationController
  def index
    @images = Image.all
    render "index.json.jb"
  end

  def show
    @image = Image.find_by(id: params["id"])
    render 'show.json.jb'
  end

  def create
    @image = Image.new(
      url: params["url"],
      product_id: params["product_id"],
    )
    if @image.save
      render 'show.json.jb'
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.url = params["url"] || @image.url
    @image.product_id = params["product_id"] || @image.product_id
    @image.save
    if @image.save
      render 'show.json.jb'
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  def destroy
    image = Image.find_by(id: params[:id]) #do not need instance, not viewing
    image.destroy #do not need @ to create instance, not viewing
    render json: {message: 'image destroyed'}
  end
end