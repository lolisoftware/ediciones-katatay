class ShippingAddress < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  belongs_to :state

  validates :address, presence: true
  validates :postal_code, presence: true
  validates :city, presence: true
  validates :country_id, presence: true
  validates :user_id, presence: true
end
