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
      redirect_to project_path(@project.id), :notice => "New project saved! Way to go."
    else
      render "new"
    end    
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project.id), :notice => "Project updated! Way to go."
    else
      render "edit"
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def destroy
    @project = Project.find(params[:id]).delete
    redirect_to projects_path, :notice => "Your project has been deleted."
  end
  
end