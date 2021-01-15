class Api::ProductsController < ApplicationController
  def index
    @all_cameras = Product.all
    render 'index.json.jb'
  end

  def show
    @camera = Product.find_by(id: params["id"])
    render 'show.json.jb'
  end
end
