class Admin::StaticPagesController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :verify_admin

  def home
  end
end
