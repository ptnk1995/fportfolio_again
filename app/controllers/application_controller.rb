class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout

  def layout
    is_a?(Devise::SessionsController) ? false : "application"
  end
end
