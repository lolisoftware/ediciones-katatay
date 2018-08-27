class Contact < ActiveRecord::Base
  validates :email, :email => true, presence: true
  validates :name, presence: true
  validates :subject, presence: true
  validates :message, presence: true

  rails_admin do
    edit do
      field :name do
        required true
      end
      field :subject do
        required true
      end
      field :email do
        required true
      end
      field :message do
        required true
      end
    end
  end
end
