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
    elsif params[:category]
      @products = Category.find_by(title: params[:category]).products
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
      description: params[:description],
      quantity: params[:quantity],
      )
    @new_product.save
    flash[:success] = "Product successfully created!"
    redirect_to "/products/#{product.id}"
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

  def search
    search_term = params[:search]
    @products = Product.where("name ILIKE ?", "%#{search_term}%")
    render "index.html.erb"
  end

end
