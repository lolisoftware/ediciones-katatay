class Distributor < ActiveRecord::Base
  belongs_to :city

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true

  rails_admin do
    edit do
      field :name do
        required true
      end
      field :address do
        required true
      end
      field :city do
        required true
      end
    end
  end
end
