class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carts
  belongs_to :shipping_address
end

