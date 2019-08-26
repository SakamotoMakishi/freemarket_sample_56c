# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_header, only: [:edit, :update]
  

  # GET /resource/sign_up
  def new
    super
  end

  # GET /resource/sign_up
  # def sns
  #   @user = User.new(
  #     nickname: session[:nickname],
  #     email: session[:email],
  #     password: session[:password],
  #     password_confirmation: session[:password],
  #     )
  # end

  # POST /resource
  def create
  
    if verify_recaptcha   
    # if params[:user][:password] == nil
    #   params[:user][:password] = session[:password]
    #   params[:user][:password_confirmation] = session[:password]
    #   super
    #   @user.uid = session[:uid]
    #   @user.provider = session[:provider]
    #   @user.save
    # else
      super
    # end
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    sms_message_users_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    sms_message_users_path
  end

  def set_header
    @parrent_categories = Category.where(parrent_id: 0)
    @child_categories = Category.where(parrent_id: Category.where(parrent_id: 0).ids).group_by(&:parrent_id)
    @grandchild_categories3 = Category.where(parrent_id: Category.where(parrent_id: Category.where(parrent_id: 0).ids).ids).group_by(&:parrent_id)
  end
end
