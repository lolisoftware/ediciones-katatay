class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :null => false
      t.decimal :shipping_cost, :null => false
      t.belongs_to :state

      t.timestamps
    end
  end
end
