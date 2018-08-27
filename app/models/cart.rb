class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :order

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true
end
