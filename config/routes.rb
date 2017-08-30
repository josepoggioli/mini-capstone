Rails.application.routes.draw do
  get "/products" => "products#products_page"
end
