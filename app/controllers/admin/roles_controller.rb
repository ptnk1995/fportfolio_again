class Admin::RolesController < Admin::BaseController
  load_and_authorize_resource except: [:create]
  authorize_resource

  before_action :create_role, only: [:index, :new]

  def index
    @roles = Role.all
  end

  def create
     @role = Role.new role_params
    if @role.save
      flash[:success] = t "create_success"
      redirect_to admin_roles_path
    else
      render :index
    end
  end

  def show
    @users = User.with_all_roles @role.name
  end

  def edit
  end

  def update
    if @role.update_attributes role_params
      flash[:success] = t ".updated"
      redirect_to admin_roles_path
    else
      render :index
    end
  end

  def destroy
    @role = Role.find_by(id: params[:id])
    if @role.destroy
      flash[:success] = t "dashboard.holidays.form.delete_success"
    else
      flash[:warning] = t "dashboard.holidays.form.delete_not_success"
    end
    redirect_to admin_roles_path
  end

  def role_params
    params.require(:role).permit(:name)
  end

  def create_role
    @role = Role.new
  end

  # def load_Role
  #   @role= Role.find_by(id: params[:id])
  # end
end
