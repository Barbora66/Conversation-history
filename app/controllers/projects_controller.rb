class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to project_path(@project), notice: "Project was successfully updated."
    else
      render project_path(@project), notice: "Something went wrong"
    end
  end

  private

  def project_params
    params.require(:project).permit(:closed)
  end
end
