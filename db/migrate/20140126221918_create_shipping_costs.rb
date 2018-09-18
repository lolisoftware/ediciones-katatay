class CreateShippingCosts < ActiveRecord::Migration
  def change
    create_table :shipping_costs do |t|
      t.decimal :cost, :null => false
      t.decimal :weight, :null => false
      t.belongs_to :state
      t.belongs_to :country

      t.timestamps
    end
  end
end
