class PublicPagesController < ApplicationController
  def index
    @items_news = Item.where(:new => true).order(:order)
    @items_katatay = Item.includes(:category).where('categories.name' => 'revista katatay').references(:category).limit(3).order(:order)
    @cart_form = Cart.new
  end

  def portada
    @main = Text.find_by_name('quienes somos')
    @miembros = Text.find_by_name('miembros')
  end

  def distribution
    @distribucion = Text.find_by_name('distribucion')
  end

  def referato
    @referato = Text.find_by_name('referato')
  end

  def contact
    @contact = Text.find_by_name('contacto')
    @contact_form = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if verify_recaptcha(:model => @contact, :message => "Captcha Incorrecto") && @contact.save
      ContactMailer.send_contact_form(@contact).deliver
      render :json => @contact
    else
      render :json => {:errors => @contact.errors.full_messages}, :status => 422
    end
  end

  private
  def contact_params
    params[:contact].permit(:name, :subject, :email, :message)
  end
end
