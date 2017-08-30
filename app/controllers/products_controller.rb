class ProductsController < ApplicationController

  def products_page
    @products = Products.all
    render "products.html.erb"
  end

end
