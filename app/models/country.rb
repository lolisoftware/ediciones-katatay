class Country < ActiveRecord::Base
  has_many :states

  validates :name, presence: true

  rails_admin do
    edit do
      field :name do
        required true
      end
    end
  end
end
