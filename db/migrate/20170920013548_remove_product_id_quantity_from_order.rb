class RemoveProductIdQuantityFromOrder < ActiveRecord::Migration[5.1]
    remove_column :orders, :product_id, :integer
    remove_column :orders, :quantity, :integer
  def change
  end
end
