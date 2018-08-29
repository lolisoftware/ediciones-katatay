class AddOrderToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :order, index: true
  end
end
