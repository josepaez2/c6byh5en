# require 'json'

class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end
  def show
    redirect_to api_v1_products_path
  end
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.update(params[:id], product_params)
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
