class ProductsController < ApplicationController

  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "#{@product.title} created successfully"
      redirect_to products_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @product.destroy
    flash[:success] = "#{@product.title} removed successfully"
    redirect_to products_path
  end

  def update
    if @product.update(product_params)
      flash[:success] = "#{@product.title} updated successfully"
      redirect_to products_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id].to_i)
  end
end
