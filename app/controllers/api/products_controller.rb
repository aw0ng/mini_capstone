class Api::ProductsController < ApplicationController
  def camera_store
    @all_cameras = Product.all
    render 'camera_store.json.jb'
  end
end
