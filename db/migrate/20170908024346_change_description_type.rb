class ChangeDescriptionType < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :in_stock, :boolean, default: true
  end
end
