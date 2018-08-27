class Item < ActiveRecord::Base
  belongs_to :category
  has_attached_file :image,
                    :styles => {:medium => ["300x300>", :png], :thumb => ["100x100>", :png]},
                    :processors => [:thumbnail, :paperclip_optimizer],
                    :default_url => "/images/:style/missing.png"
  has_attached_file :index
  has_attached_file :fulltext
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  paginates_per 6
  has_many :reviews

  validates :category, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :price, presence: true
  validates :weight, presence: true

  rails_admin do
    edit do
      field :category do
        required true
      end
      field :new
      field :order
      field :image do
        required true
      end
      field :title do
        required true
      end
      field :subtitle
      field :year
      field :format
      field :pages
      field :author
      field :isbn
      field :price do
        required true
      end
      field :has_stock
      field :weight do
        required true
      end
      field :description, :ck_editor
      field :index
      field :fulltext
    end
  end
end
