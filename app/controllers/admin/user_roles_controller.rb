class Admin::UserRolesController < Admin::BaseController

  def index
  end

  def show
    @role = Role.find_by(id: params[:id])
    @users = User.with_all_roles @role.name
  end
end
