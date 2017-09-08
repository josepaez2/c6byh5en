# require 'json'

class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    @products.to_json
  end
  def api
    @products = Product.all
    # respond_to do |format|
    #     format.html { render :api}
    #     format.json { render :api}
    # end
    return @products.to_json
  end
  def show
    redirect_to products_path
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
