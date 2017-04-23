class Admin::ProjectsController < Admin::BaseController
  #before_action :check_max_files, only: :create
  load_and_authorize_resource except: [:create]
  authorize_resource

  def index
    @projects = Project.all
    @count = []
    Category.project.each do |category|
      @count.push(@projects.where(category_id: category.id).count)
    end
    @name_category_blog = Category.project.pluck(:name)
    @arr = @name_category_blog.zip(@count)
  end

  def new
    @project = Project.new
    @project_techniques = @project.technique_projects.build
    @project_features = @project.feature_projects.build
  end

  def create
   # binding.pry
     if params[:project][:images].size > Settings.project.max_image_files
      flash[:error] = "project.check_max_files"
      binding.pry
      render :new
      return
    end
    @project = Project.create! project_params

   # binding.pry
    if @project.persisted?
      params[:project][:images].each {|image| @project.images.build(image: image).save}
      params[:project][:participate].each do |k, v|
      #  binding.pry
        Participate.create!(position: v[:name], user_id: v[:id], project_id: @project.id) if v[:name].present? && v[:id].present?

      end
      flash[:success] = t "create_success"
      redirect_to admin_projects_path
    else
      @project = Project.new
      @project_techniques = @project.technique_projects.build
      @project_features = @project.feature_projects.build
      render :new
    end
  end

  def edit
    @project = Project.find_by id: params[:id]
  end

  def update
    if @project.update_attributes project_params
      @project.participates.destroy_all
      params[:project][:participate].each do |k, v|
        Participate.create!(position: v[:name], user_id: v[:id], project_id: @project.id) if v[:name].present? && v[:id].present?
      end
      flash[:success] = t "create_success"
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @project.destroy
      binding.pry
      flash[:success] = t "dashboard.holidays.form.delete_success"
    else
      flash[:warning] = t "dashboard.holidays.form.delete_not_success"
    end
    redirect_to admin_projects_path
  end

  private

  def check_max_files
   # binding.pry
    if images_params[:images].size > Settings.project.max_image_files
      flash[:danger] = t "project.check_max_files"
      render :new
    end
  end

  def project_params
   # binding.pry
    technique_ids = params[:techniques][:id]
    feature_ids = params[:project][:feature_ids]

    params.require(:project).permit(:name, :url, :category_id,
      :description).merge! feature_ids: feature_ids, technique_ids: technique_ids
  end

  def images_params
    params.require(:project).permit images: []
  end
end
