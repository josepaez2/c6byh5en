require 'httparty'

class Api::V1::ProductsController < ApplicationController


skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
    render json: @products
    # revisando en la pantalla del servidor si está 
    # creando los productos y rails c irb confirma
    # HTTParty.post('http://localhost:3000/api/v1/products', body: { name: "Producto 3", price: 39}.to_json, headers: { 'Content-Type' => 'application/json' })
  end

  def show
    redirect_to api_v1_products_path
  end
  def new
    @product = Product.new
  end

  def create
    # params es   Parameters: {"name"=>"Producto 3", "price"=>39, "product"=>{"name"=>"Producto 3", "price"=>39}}
    @product = Product.new(product_params)
    if @product.save
      render json: @product, :status => 201
    else 
      render json: @product.errors.full_messages, :status => 422
    end
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
