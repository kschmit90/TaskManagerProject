class PagesController < ApplicationController
  skip_before_filter :authorize, :only => [:home, :update]
  
  def home
    @user = User.new
  end
  
  def dashboard
    @task = Task.new
    @tasks = Task.all
    @activities = Activity.order("created_at desc")
  end
  
  def update
    @task = Task.all
    
    if @task.update_attributes(params[:task])
      track_activity @task
      
      redirect_to dashboard_path(@task.id), :notice => "You rock!"
    else
      flash[:alert] = "Oops! Something went wrong. Please, try again."
      render "dashboard"
    end
  end
  
end
