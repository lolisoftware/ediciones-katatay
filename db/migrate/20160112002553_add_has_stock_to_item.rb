class AddHasStockToItem < ActiveRecord::Migration
  def change
    add_column :items, :has_stock, :boolean, :default => true
  end
end
