class RemoveShippingCostFromCountry < ActiveRecord::Migration
  def change
    remove_column :countries, :shipping_cost, :decimal
  end
end
