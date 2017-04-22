class TeamsController < BaseController
  before_action :load_project, only: :index
  def index
    @participates= @project.participates
  end

  def load_project
    @project = Project.find_by id: params[:project_id]
  end
end
