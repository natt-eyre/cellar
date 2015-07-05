class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :expiry_date, :quantity)
  end
end
