class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.boolean :payment
      t.boolean :shipping
      t.text :observations
      t.string :mpid

      t.timestamps
    end
  end
end
