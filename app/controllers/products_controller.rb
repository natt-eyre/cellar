class ProductsController < ApplicationController
  before_action :require_login

  def new
    @product = Product.new
  end

  def index
    @products = current_user.products
  end

  def create
    @product = current_user.products.new(product_params)
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
