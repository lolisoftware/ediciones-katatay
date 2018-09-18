class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :amount
      t.belongs_to :user
      t.references :item, index: true

      t.timestamps
    end
  end
end
