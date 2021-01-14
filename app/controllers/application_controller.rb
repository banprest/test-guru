class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.admin?
      flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}"
      admin_tests_path
    else
      tests_path
    end    
  end

  def default_url_options
    if I18n.locale == I18n.default_locale
      {}
    else
      { lang: I18n.locale }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :last_name, :first_name, :password, :password_confirmation)
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
