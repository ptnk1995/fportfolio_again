class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout
  before_filter :set_locale

  def layout
    is_a?(Devise::SessionsController) ? false : "application"
  end

  def set_locale
    I18n.locale = params[:locale] || :en
  end

  def verify_admin
    unless current_user.has_role? :admin?
      flash[:notice] = t "flash.notice.permission_denied"
      redirect_to root_url
    end
  end
end
