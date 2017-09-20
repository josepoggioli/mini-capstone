class CartedProductsController < ApplicationController

  def index
    if current_user && current_user.carted_products.where(status: "carted")
      @products = current_user.carted_products.where(status: "carted")
      @subtotal = 0
      
      @products.each do |carted_product|
          @subtotal += carted_product.quantity * carted_product.product.price
        end
      @tax = @subtotal * 0.09
      @total = @tax + @subtotal
    elsif current_user
      flash[:warning] = "You have no products on your cart."
    else
      flash[:warning] = "You must log in to be able to see your cart."
    end
    
    render "index.html.erb"
  end

  def create  
     if current_user 
        CartedProduct.create(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        status: "carted"  
        )
      flash[:success] = "Product added to cart!"
      redirect_to "/cart"
    else
      flash[:warning] = "You need to be logged in to be able to add to your cart."
      redirect_to "/login"
    end
  end

  def destroy
    cartedProduct = CartedProduct.find(params[:id])
    cartedProduct.destroy
    flash[:danger] = "Product removed from cart!"
    redirect_to "/cart"
  end  

end
