class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.new
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
    
  end
  
  def update
  end
  
  def destroy
  end
  
end
