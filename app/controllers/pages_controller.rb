class PagesController < ApplicationController
  skip_before_filter :authorize
  
  def dashboard
    @task = Task.all
    
  end
end
