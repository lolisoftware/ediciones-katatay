class AddShippingCostToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_cost, :decimal
  end
end
