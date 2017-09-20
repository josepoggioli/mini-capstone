class ImagesController < ApplicationController
  
  def new
    @product = Product.find_by(id: params[:product_id])
    render "new.html.erb"
  end

  def create  
   @new_image = Image.new(
      url: params[:url],
      product_id: params[:product_id],
      )
    @new_image.save
    flash[:success] = "Image sucessfully added!"
    redirect_to "/products/#{params[:product_id]}"
  end  

  def show
    @product = Product.find(params[:product_id])
    render "show.html.erb"
  end

   def destroy
    @image = Image.find(params[:id])
    image_prod_id = @image.product.id
    @image.destroy
    flash[:danger] = "Image succesfully deleted!"
    redirect_to "/products/#{image_prod_id}"
  end

end
