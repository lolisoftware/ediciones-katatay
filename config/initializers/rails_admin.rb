RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method { current_user }
  config.authorize_with :cancan
  config.included_models = ["City", "Category", "Contact", "Country", "Distributor", "Item", "Order", "Review", "ShippingAddress", "ShippingCost", "State", "Text", "User"]
end
