class ProductsController < ApplicationController

  def products_page
    @products = Product.all
    render "products.html.erb"
  end

end
