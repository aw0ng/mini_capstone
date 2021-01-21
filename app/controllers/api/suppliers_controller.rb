class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "index.json.jb"
  end

  def show
    @supplier = Supplier.find_by(id: params["id"])
    render 'show.json.jb'
  end

  def create
    @supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],
    )
    if @supplier.save
      render 'show.json.jb'
    else
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number
    @supplier.save
    if @supplier.save
      render 'show.json.jb'
    else
      render json: { errors: @supplier.errors.full_messages }, status: 422
    end
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id]) #do not need instance, not viewing
    supplier.destroy #do not need @ to create instance, not viewing
    render json: {message: 'supplier destroyed'}
  end
end