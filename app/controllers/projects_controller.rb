class ProjectsController < BaseController
  before_action :load_categories_project, only: [:index, :show]
  def index
    @projects = Project.recent
    if params[:category].blank?
      @projects = Project.recent.page(params[:page]).per Settings.per_page
    else
      @category = Category.find_by id: params[:category]
      unless @category
        flash[:danger] = t "record_isnt_exist"
        redirect_to projects_path
      else
        @projects = @category.projects.recent.page(params[:page]).per Settings.per_page
      end
    end
  end

  def show
    @project = Project.find_by id: params[:id]
    if @project
    else
      flash[:danger] = t "record_isnt_exist"
      redirect_to projects_path
    end
  end

  def load_categories_project
    @categories = Category.project
  end
end
