class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, :null => false
      t.decimal :shipping_cost, :null => false
      t.belongs_to :country

      t.timestamps
    end
  end
end
