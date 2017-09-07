# require 'json'

class ProductsController < ApplicationController
  def index
    @products = Product.all
    # puts @products.first.id
    # puts @products.first.name
    # puts @products.first.price
    # puts @products.first.created_at
    # puts @products.first.updated_at
    return @products.to_json
  end
  def api
    @products = Product.all
    return @products.to_json
  end
# [{"id":8,"name":"Producto 1","price":"19.0","created_at":"2015-09-13T21:42:09.683Z","updated_at":"2015-09-18T20:56:45.937Z"},{"id":9,"name":"Producto 2","price":"23.0","created_at":"2015-09-18T20:56:22.422Z","updated_at":"2015-09-18T20:56:49.839Z"}]
# [<Product id: 1, name: "Producto 1", price: #<BigDecimal:7ff23c6b6c60,'0.19E2',9(27)>, created_at: "2017-09-07 19:57:32", updated_at: "2017-09-07 19:57:32">
#  <Product id: 2, name: "Producto 2", price: #<BigDecimal:7ff23c6b50b8,'0.23E2',9(27)>, created_at: "2017-09-07 19:57:32", updated_at: "2017-09-07 19:57:32">]

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end

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
