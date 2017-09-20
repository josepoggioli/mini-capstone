class OrdersController < ApplicationController

   def create  
    @products = current_user.carted_products.where(status: "carted")
    
    @subtotal = 0
    @products.each do |carted_product|
      @subtotal += carted_product.quantity * carted_product.product.price
     end
    @tax = @subtotal * 0.09
    @total = @tax + @subtotal

    order = Order.create(
      user_id: current_user.id,
      subtotal: @subtotal,
      tax: @tax,
      total: @total, 
      )
      
    #@products.update(status: "purchased", order_id: order.id)
    #flash[:success] = "Order successfully created!"
    redirect_to "/orders/#{order.id}"
  end  

  def show
    @order = Order.find(params[:id])
    render :show
  end

end

  