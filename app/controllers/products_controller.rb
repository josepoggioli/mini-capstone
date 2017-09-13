class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:sort]=='price-desc'
      @products = Product.all.order(price: :desc)
    elsif params[:sort]=='price'
      @products = Product.all.order(:price)
    elsif params[:show]=='discounted'
      @products = Product.where("price < ?",2)
    elsif params[:show]=='random'
      @products = Product.order("RANDOM()").limit(1)
    elsif params[:show]=='search'
      @products = Product.find_by(name: params[:search])
    end
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create  
   @new_product = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      quantity: params[:quantity],
      )
    @new_product.save
    flash[:success] = "Product successfully created!"
    render "create.html.erb"
  end  

  def show
    @product = Product.find(params[:id])
    render "show.html.erb"
  end

  def edit
    @product = Product.find (params[:id])
    render "edit.html.erb"
  end

  def update
    product = Product.find(params[:id])
    product.update(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description],
      quantity: params[:quantity],
      )
    flash[:primary] = "Product succesfully updated!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:danger] = "Product succesfully destroyed!"
    render "destroy.html.erb"
  end

end
