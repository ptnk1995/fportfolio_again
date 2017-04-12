class Admin::ProjectsController < ApplicationController
  layout "admin"

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
    @project = Project.new project_params
    if @project.save
      flash[:success] = t "create_success"
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def edit
    @project = Project.find_by id: params[:id]
  end

  def update
  end

  def show
  end

  private
  def project_params
     binding.pry
    technique_ids = params[:techniques][:id]
    feature_ids = params[:project][:feature_ids]
    params.require(:project).permit(:name, :url, :category_id, :description).merge! feature_ids: feature_ids, technique_ids: technique_ids
  end
end
