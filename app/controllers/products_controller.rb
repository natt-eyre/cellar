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

  def destroy
    product = current_user.products.find(params[:id])
    product.destroy!
    redirect_to products_path
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])
    p @product

    if @product.update_attributes(product_params)
      p 1
      p @product
      p product_params
      redirect_to products_path
    else
      p 2
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :expiry_date, :quantity)
  end
end
