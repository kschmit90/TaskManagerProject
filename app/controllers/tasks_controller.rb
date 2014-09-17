require 'pony'

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
    
    @projects = Project.all
  
    @categories = Category.all
    @users = User.all
  end
  
  def add_user
    @task = Task.find(params[:id])
    @task.users << User.find(params[:task][:users].to_i)
    
    @user = User.find(params[:task][:users].to_i)
    binding.pry
    if Pony.mail(:to => @user.email, :from => 'rpjktest.email@gmail.com', :subject => 'hi ' + @user.name, :body => 'Hello there ' + @user.name + ' your task is ' + @task.name, :via => :smtp, :via_options => {:address => 'smtp.gmail.com',
    :port => '587', :authentication => :plain, :user_name => 'rpjktest.email@gmail.com', :password => 'Testpassword'}) 
      redirect_to task_path(@task.id)
    else
      render 'edit'
    end
  end
 
  
  def add_category
    @task = Task.find(params[:id])
    
    @category = Category.find(params[:task][:categories].to_i)
    
    @task.categories << @category
    
    redirect_to task_path(@task.id)
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
    Task.find(params[:id]).delete
    redirect_to tasks_path, :notice => "Your task has been deleted."
  end
  
  def show
    @task = Task.find(params[:id])
  end
end