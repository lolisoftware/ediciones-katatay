class ShippingCost < ActiveRecord::Base
  belongs_to :country
  belongs_to :state

  validates :cost, presence: true
  validates :weight, presence: true
  validates :country, presence: true

  rails_admin do
    edit do
      field :cost do
        required true
      end
      field :weight do
        required true
      end
      field :country do
        required true
      end
      field :state
    end
  end
end
