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
end
