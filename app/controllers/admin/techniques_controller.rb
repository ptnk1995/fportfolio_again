class Admin::TechniquesController < Admin::BaseController
  load_and_authorize_resource except: [:create]
  authorize_resource

  before_action :create_technique, only: [:index, :new]
  before_action :load_technique, except: [:index]
  def index
    @techniques = Technique.all
  end

  def new
  end

  def create
    @technique = Technique.new technique_params
    if @technique.save
      flash[:success] = t "create_success"
      redirect_to admin_techniques_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @technique.update_attributes technique_params
      flash[:success] = t ".updated"
      redirect_to admin_techniques_path
    else
      render :index
    end
  end

  def destroy
    @technique = Technique.find_by(id: params[:id])
    if @technique.destroy
      flash[:success] = t "dashboard.holidays.form.delete_success"
    else
      flash[:warning] = t "dashboard.holidays.form.delete_not_success"
    end
    redirect_to admin_techniques_path
  end

  def technique_params
    params.require(:technique).permit(:name, :image)
  end

  def create_technique
    @technique = Technique.new
  end

  def load_technique
    @technique = Technique.find_by(id: params[:id])
  end
end
