class Review < ActiveRecord::Base
  belongs_to :item
  has_attached_file :text
  validates_attachment_content_type :text, :content_type => ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword",
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
             "text/plain"]

  validates :item, presence: true
  validates :title, presence: true
  validates :text, presence: true

  rails_admin do
    edit do
      field :item do
        required true
      end
      field :title do
        required true
      end
      field :text do
        required true
      end
    end
  end
end
