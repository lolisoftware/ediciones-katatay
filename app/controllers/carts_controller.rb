class CartsController < ApplicationController
  include PublicPagesHelper
  layout 'public_pages'
  before_filter :authenticate_user!

  def add
    if item_in_cart?(params[:item])
      @cart = Cart.where(:user => current_user, :order_id => nil, :item_id => params[:item]).first
      @cart.amount = @cart.amount + params[:cart][:amount].to_i
    else
      @cart = Cart.new
      @cart.user = current_user
      @cart.item_id = params[:item]
      @cart.amount = params[:cart][:amount]
    end

    if @cart.save
      redirect_to :back
    end
  end

  def index
    @cart_items = Cart.where(:user => current_user, :order_id => nil).order(:created_at)
  end

  def empty
    @cart_items = Cart.where(:user => current_user, :order_id => nil).delete_all

    redirect_to :cart
  end

  def delete
    Cart.where(:user => current_user, :order_id => nil, :id => params[:id]).first.delete

    redirect_to :cart
  end

  def update
    @cart = Cart.where(:user => current_user, :order_id => nil, :id => params[:id]).first
    @cart.amount = params[:amount]

    if @cart.save
      redirect_to :cart
    end
  end

  def checkout
    require 'mercadopago'
    @carts = Cart.where(:user => current_user, :order_id => nil)
    @address = ShippingAddress.find(params[:address])
    shipping_cost = get_shipping_cost(@address, @carts.inject(0) {|sum, cart| sum + cart.item.weight * cart.amount})

    #genero la orden
    @order = Order.new(:user => current_user, :carts => @carts, :payment => false, :shipping => false, :shipping_address => @address, :shipping_cost => shipping_cost, :digital => false)
    @order.save

    #PRODUCTION MODE
    mp = MercadoPago.new('3458896497974347', 'y9LqEl9urFP2OQaVGj7Y2SrwRfInVfVF')

    #SANDBOX MODE
    #mp = MercadoPago.new('5600753441758584', 'PFbwNiOCnVrrEh6sYlEeOuGV0RdFmbq8')
    #mp.sandbox_mode(true)

    items = Array.new
    @carts.each do |cart|
      items.push(:title => 'Compra en Ediciones Katatay', :quantity => cart.amount, :unit_price => cart.item.price.to_i, :currency_id => 'ARS')
    end
    items.push(:title => 'Costo de envio', :quantity => 1, :unit_price =>  shipping_cost.to_i, :currency_id => 'ARS')
    preferenceData = Hash[
        "items" => items,
        "external_reference" => @order.id,
        "back_urls" => {
            "success" => "http://www.edicioneskatatay.com.ar/users/edit"
        }
    ]
    preference = mp.create_preference(preferenceData)
    logger.fatal "#{preferenceData.inspect}"
    logger.fatal "#{preference.inspect}"
    #PRODUCTION MODE
    @init_payment = preference["response"]["init_point"]

    #SANDBOX MODE
    #@init_payment = preference["response"]["sandbox_init_point"]
  end

  def digital_buy
    require 'mercadopago.rb'
    @item = Item.find(params[:id])
    #Creo un nuevo cart, le agrego el item y hago el checkout a mercadopago
    cart = Cart.new
    cart.user = current_user
    cart.item = @item
    cart.amount = @item.price
    if cart.save
      #genero la orden
      @order = Order.new(:user => current_user, :carts => [cart], :payment => false, :shipping => false, :digital => true)
      if @order.save
        #PRODUCTION MODE
        mp = MercadoPago.new('3458896497974347', 'y9LqEl9urFP2OQaVGj7Y2SrwRfInVfVF')
        #mp = MercadoPago::Client.new('3458896497974347', 'y9LqEl9urFP2OQaVGj7Y2SrwRfInVfVF')
        puts "/////////////////////////////////////////////////"
        puts "#{mp}"

        #SANDBOX MODE
        #mp = MercadoPago.new('5600753441758584', 'PFbwNiOCnVrrEh6sYlEeOuGV0RdFmbq8')
        #mp.sandbox_mode(true)
        items = Array.new
        items.push(:title => 'Compra Digital en Ediciones Katatay', :quantity => 1, :unit_price => @item.price.to_i, :currency_id => 'ARS')
        preferenceData = {
            items: items,
            external_reference: @order.id,
            back_urls: {
                success: "http://www.edicioneskatatay.com.ar/users/edit"
            }
        }
        preference = mp.create_preference(preferenceData)
        puts "/////////////////////////////////////////////////"
        puts "#{preference}"
        puts "/////////////////////////////////////////////////"
        #PRODUCTION MODE
        @order.url = preference["response"]["init_point"]
        #SANDBOX MODE
        #@order.url = preference["response"]["sandbox_init_point"]

        @order.save!
        redirect_to @order.url
      end
    end
  end

  def download_digital_order
    if Order.exists?(params[:order])
      order = Order.find(params[:order])
      if (order.user != current_user) || (!order.payment)
        render :json => 'No es posible obtener el item especificado'
      else
        pdf_filename = File.open(order.carts.first.item.fulltext.path)
        send_file(pdf_filename, :filename => File.basename(order.carts.first.item.fulltext.path), :type => "application/pdf")
      end
    else
      render :json => 'No es posible obtener el item especificado'
    end
  end
end
