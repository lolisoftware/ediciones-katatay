class City < ActiveRecord::Base
  belongs_to :state
  has_many :distributors

  validates :name, presence: true
  validates :state, presence: true
  validates :position, presence: true

  rails_admin do
    edit do
      field :name do
        required true
      end
      field :state do
        required true
      end
      field :position
    end
  end
end
