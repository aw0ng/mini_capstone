class Api::ProductsController < ApplicationController
  def camera_store
    @all_cameras = Product.all
    render 'camera_store.json.jb'
  end

  def camera_brand_sony
    @sony_camera = Product.find_by(id: 1)
    render 'sony.json.jb'
  end

  def camera_brand_canon
    @canon_camera = Product.find_by(id: 2)
    render 'canon.json.jb'
  end

  def camera_brand_nikon
    @nikon_camera = Product.find_by(id: 3)
    render 'nikon.json.jb'
  end
end
