class Users::RegistrationController < Devise::RegistrationsController
  layout 'public_pages'

  def create
#    if verify_recaptcha
      super
#    else
#      build_resource(sign_up_params)
#      clean_up_passwords(resource)
#      flash.now[:alert] = "El captcha es incorrecto. Inténtelo nuevamente."
#      flash.delete :recaptcha_error
#      render :new
#    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  def edit
    @orders = Order.where(:user => current_user, :digital => false)
    @digital_orders = Order.where(:user => current_user, :digital => true)
    super
  end

  def sign_up_params
    params.require(:user).permit(:name, :surname, :birthdate, :email, :password, :password_confirmation, :country_id, :state_id)
  end

  def account_update_params
    params.require(:user).permit(:name, :surname, :birthdate, :email, :password, :password_confirmation, :country_id, :state_id)
  end
end
