class Admin::BaseController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  private
  def check_is_admin?
    return if current_user.has_role? :admin
    flash[:danger] = t "messages.fail_right"
    redirect_to admin_errors_path
  end
end
