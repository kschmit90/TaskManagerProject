class ProjectsController < ApplicationController
  skip_before_filter :authorize  
  
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
      binding.pry
      redirect_to project_path(@project), :notice => "New project saved! Way to go."
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
      redirect_to project_path(@project), :notice => "Project updated! Way to go."
    else
      render "edit"
    end
  end
  
  def show
    @project = Project.find_by_slug(params[:id])
  end
  
  def destroy
    Project.find_by_slug(params[:id]).delete
    redirect_to projects_path, :notice => "Your project has been deleted."
  end
  
end