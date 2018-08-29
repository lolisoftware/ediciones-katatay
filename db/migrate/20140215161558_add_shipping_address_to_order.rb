class AddShippingAddressToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :shipping_address
  end
end
