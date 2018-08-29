class RemoveShippingCostFromState < ActiveRecord::Migration
  def change
    remove_column :states, :shipping_cost, :decimal
  end
end
