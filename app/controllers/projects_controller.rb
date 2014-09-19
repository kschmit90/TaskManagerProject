class ProjectsController < ApplicationController
  @@new_project = "New project saved! Way to go."
  @@edit_project = "Project updated! Way to go."
  @@delete_project = "Your project has been deleted."
  
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      @project.create_slug(@project)
      track_activity @project

      redirect_to project_path(@project), :notice => @@new_project
    else
      render "new"
    end
  end

  def edit
    @project = Project.find_by_slug(params[:id])
  end

  def update
    @project = Project.find_by_slug(params[:id])

    if @project.update_attributes(params[:project])
      @project.create_slug(@project)
      track_activity @project

      redirect_to project_path(@project), :notice => @@edit_project
    else
      render "edit"
    end
  end

  def show
    @project = Project.find_by_slug(params[:id])
  end

  def destroy
    @project_id = Project.find_by_slug(params[:id]).id
    @project = Project.find_by_slug(params[:id])

    delete_tracked_projects
    delete_slug(Project)
    redirect_to dashboard_path, :notice => @@delete_project
  end
end
