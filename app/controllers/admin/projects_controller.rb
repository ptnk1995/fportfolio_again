class Admin::ProjectsController < ApplicationController
  layout "admin"

  def index
  end

  def new
    @project = Project.new
    @project_techniques = @project.technique_projects.build
    @project_features = @project.feature_projects.build
  end

  def create
    @project = Project.new project_params
          binding.pry

    if @project.save
      flash[:success] = t "create_success"
      redirect_to admin_projects_path
    else
      render :index
    end
  end

  def show
  end

  def create
  end

  private
  def project_params
        binding.pry

    technique_ids = params[:techniques][:id]
    feature_ids = params[:project][:feature_ids]
    params.require(:project).permit(:name, :url, :category_id, :description).merge! feature_ids: feature_ids, technique_ids: techniques_ids
  end
end
