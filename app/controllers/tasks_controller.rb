class TasksController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show]
  
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
    
  end
  
  def create
    @task = Task.new(params[:task])
    
    if @task.save
      redirect_to task_path(@task.id), :notice => "New task saved! Way to go."
    else
      render "new"
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update_attributes(params[:task])
      redirect_to task_path(@task.id), :notice => "Task updated! Way to go."
    else
      render "edit"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path, :notice => "Your task has been deleted."
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
end