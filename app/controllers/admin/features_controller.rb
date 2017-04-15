class Admin::FeaturesController < Admin::BaseController
  load_and_authorize_resource except: [:create]
  authorize_resource

  before_action :create_feature, only: [:index, :new]

  def index
    @features = Feature.all
  end

  def new
  end

  def create
    @feature = Feature.new feature_params
    if @feature.save
      flash[:success] = t "create_success"
      redirect_to admin_features_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @feature.update_attributes feature_params
      flash[:success] = t ".updated"
      redirect_to admin_features_path
    else
      render :index
    end
  end

  def destroy
    @feature = Feature.find_by(id: params[:id])
    if @feature.destroy
      flash[:success] = t "dashboard.holidays.form.delete_success"
    else
      flash[:warning] = t "dashboard.holidays.form.delete_not_success"
    end
    redirect_to admin_features_path
  end

  def feature_params
    params.require(:feature).permit(:name, :image)
  end

  def create_feature
    @feature = Feature.new
  end
end
