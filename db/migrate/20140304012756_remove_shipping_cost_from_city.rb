class RemoveShippingCostFromCity < ActiveRecord::Migration
  def change
    remove_column :cities, :shipping_cost, :decimal
  end
end
