class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.text :address
      t.string :postal_code
      t.string :city
      t.belongs_to :user
      t.references :country
      t.references :state

      t.timestamps
    end
  end
end
