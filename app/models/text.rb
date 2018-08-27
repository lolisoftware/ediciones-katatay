class Text < ActiveRecord::Base
  validates :name, presence: true

  rails_admin do
    edit do
      field :name do
        read_only true
      end
      field :text, :ck_editor
    end
  end
end
