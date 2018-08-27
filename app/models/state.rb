class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities

  validates :name, presence: true
  validates :country, presence: true
  validates :position, presence: true

  rails_admin do
    edit do
      field :name do
        required true
      end
      field :country do
        required true
      end
      field :position
    end
  end
end
