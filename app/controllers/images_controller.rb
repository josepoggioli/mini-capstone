class ImagesController < ApplicationController
  
  def new
    render "new.html.erb"
  end

  def create  
   @new_image = Image.new(
      url: params[:url],
      product_id: params[:product_id],
      )
    @new_image.save
    flash[:success] = "Product successfully created!"
    render "create.html.erb"
  end  
end
