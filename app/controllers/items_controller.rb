class ItemsController < ApplicationController
  layout 'public_pages'

  def category
    @items = Item.includes(:category).where('categories.name' => params[:category]).references(:category).order(:order).page params[:page]
    @category = params[:category]
    @cart_form = Cart.new
  end

  def index
    @libros = Item.includes(:category).where.not('categories.name' => "revista katatay").references(:category).order(:order).page params[:page]
    @cart_form = Cart.new
  end

  def show
    @item = Item.find(params[:id])
    @cart_form = Cart.new
  end
end
