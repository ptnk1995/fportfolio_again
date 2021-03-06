class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout

  before_filter :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def layout
    is_a?(Devise::SessionsController) ? false : false
  end


  def set_locale
    if params[:locale].present?
      session[:locale] = params[:locale]
    elsif session[:locale].blank?
      session[:locale] = I18n.default_locale
    end
    I18n.locale = session[:locale]
  end

  def verify_admin
    if current_user.has_role? :admin?
      redirect_to admin_root
    else
      flash[:notice] = t "flash.notice.permission_denied"
    end
  end

  # def set_locale
  #   I18n.locale = params[:locale]
  # end

  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied"
    redirect_to admin_errors_path()
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :password,:email)}
  end
end
