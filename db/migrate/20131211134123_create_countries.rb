class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, :null => false
      t.decimal :shipping_cost, :null => false

      t.timestamps
    end
  end
end
