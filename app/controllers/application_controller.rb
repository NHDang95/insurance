class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :load_category
  before_action :default_url_options

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
    locale : I18n.default_locale
  end

  protected

  def default_url_options
    { locale: I18n.locale }
  end

  def load_category
    @all_categories = Product.all_category
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :password, :password_confirmation, :phone])    
  end

  def namespace
    controller_name_segments = params[:controller].split("/")
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join("/").camelize
  end
end
