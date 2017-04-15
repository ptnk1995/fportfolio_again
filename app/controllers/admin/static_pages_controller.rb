class Admin::StaticPagesController < Admin::BaseController

  before_action :authenticate_user!

  def home
  end
end
