class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout
  before_filter :set_locale

  def layout
    is_a?(Devise::SessionsController) ? false : "application"
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

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied"
    redirect_to admin_errors_path()
  end
end
