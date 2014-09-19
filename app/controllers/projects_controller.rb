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
      track_activity @project
      
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
      @project.create_slug(@project)
      track_activity @project
      
      redirect_to project_path(@project), :notice => "Project updated! Way to go."
    else
      render "edit"
    end
  end
  
  def show
    binding.pry
    @project = Project.find_by_slug(params[:id])
  end
  
  def destroy    
    @project_id = Project.find_by_slug(params[:id]).id
    @project = Project.find_by_slug(params[:id])
    Activity.where(trackable_type: "Project", trackable_id: @project_id).each do |a|
      a.delete
    end
    Project.find_by_slug(params[:id]).delete
        
    redirect_to projects_path, :notice => "Your project has been deleted."
  end
  
end