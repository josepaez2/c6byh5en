require 'httparty'

class Api::V1::ProductsController < ApplicationController


skip_before_action :verify_authenticity_token
# protect_from_forgery with: :null_session
  def index
    @products = Product.all
    render json: @products
    # revisando en la pantalla del servidor si está 
    # creando los productos y rails c irb confirma
    # HTTParty.post('http://localhost:3000/api/v1/products', body: { name: "Producto 3", price: 39}.to_json, headers: { 'Content-Type' => 'application/json' })
    # HTTParty.post('http://localhost:3000/api/v1/products', body: {price: 39}.to_json, headers: { 'Content-Type' => 'application/json' })
    #     @product = Product.find()
    # HTTParty.patch('http://localhost:3000/api/v1/products/5', body: {name: "Yeah!", price: 10000}.to_json, headers: { 'Content-Type' => 'application/json' })
        # @product = Product.find(params[:id])
    # HTTParty.delete('http://localhost:3000/api/v1/products/4', body: {}.to_json, headers: { 'Content-Type' => 'application/json' })
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
    @product = Product.find(params[:id])
    if @product.update(product_params)
    # if @product.save
      render json: @product, :status => 200
    else 
      render json: @product.errors.full_messages, :status => 422
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    {:status => 204}
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
