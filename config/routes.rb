Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/camera_shop" => "products#camera_store"
    get "/camera_sony" => "products#camera_brand_sony"
    get "/camera_canon" => "products#camera_brand_canon"
    get "/camera_nikon" => "products#camera_brand_nikon"
  end
end
