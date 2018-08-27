class ShippingAddressesController < ApplicationController
  layout 'public_pages'
  before_filter :authenticate_user!

  def list
    @addresses = ShippingAddress.where(:user => current_user).order(:created_at => :desc)
    @address_form = ShippingAddress.new
  end

  def create
    @address = ShippingAddress.new(address_params)
    @address.user = current_user

    if @address.save
      redirect_to checkout_url(@address.id)
    end
  end

  def select
    @address = ShippingAddress.where(:user_id => current_user.id, :id => params[:selected_address]).take

    redirect_to checkout_url(@address.id)
  end

  private
  def address_params
    params[:shipping_address].permit(:country_id, :state_id, :city, :address, :postal_code)
  end
end
