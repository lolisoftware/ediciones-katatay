class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :order

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  rails_admin do
    list do
      exclude_fields :created_at, :updated_at
      field :user do
        label "Usuario"
      end
      field :item do
        label "Item"
      end
      field :amount do
        label "Precio"
      end
      field :order do
        label "Orden"
      end
      field :is_payed do
        label "Estado"
      end
    end
    edit do
      field :user do
        required true
      end
      field :item do
        required true
      end
      field :amount do
        required true
      end
      field :order do
        required true
        end
    end
  end

  def is_payed
    if self.order.nil?
      "Sin pagar"
    else
      if self.order.payment
        "Pago"
      else
        "Sin pagar"
      end
    end
  end

end
