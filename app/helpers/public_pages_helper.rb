module PublicPagesHelper
	def nav_link(link_text, link_path, sublinks = {}, target = nil)
	  class_name = current_page?(link_path) ? 'active' : ''

	  content_tag(:li, :class => class_name) do
	    link_to(link_text, link_path, target: target).concat(
       if sublinks.length > 0
         content_tag(:ul) do
           sublinks.collect do |text, path|
             nav_link(text, path)
           end.join.html_safe
         end
       end
      )
	  end
	end

  def get_friend_pages
    FriendPage.all
  end

  def get_cart_items
    Cart.where(:user => current_user, :order_id => nil)
  end

  def get_cart_items_count
    get_cart_items.count
  end

  def get_cart_items_price
    get_cart_items.inject(0) {|sum, cart| sum + cart.item.price * cart.amount}
  end

  def item_in_cart?(item_id)
    Cart.where(:user => current_user, :order_id => nil, :item_id => item_id).count > 0
  end

  def get_shipping_cost(address, weight)
    if address.state.nil?
      shipping_costs = ShippingCost.where(:country => address.country, :state_id => nil).order(weight: :asc)
    else
      shipping_costs = ShippingCost.where(:country => address.country, :state => address.state).order(weight: :asc)
    end

    shipping_cost = 0
    if shipping_costs.length > 0
      while weight > 0
        shipping_costs.each do |cost|
          if cost.weight >= weight || cost == shipping_costs.last
            shipping_cost += cost.cost
            weight -= cost.weight
            break
          end
        end
      end
    end

    shipping_cost
  end
end
