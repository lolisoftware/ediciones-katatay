class AddWeightToItem < ActiveRecord::Migration
  def change
    add_column :items, :weight, :decimal
  end
end
