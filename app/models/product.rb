class Product < ApplicationRecord
    has_many :images
    has_many :orders
    belongs_to :supplier 
    has_many :category_products
    has_many :categories, through: :category_products
    has_many :carted_products

  def sale_message
    if price.to_f < 2 
      return "Discount Item!"
    else
      return "Everyday value!"
    end
  end

  def tax
    tax_value = price.to_f * 0.09
  end

  def total 
    total_value = price.to_f + tax
  end

end
