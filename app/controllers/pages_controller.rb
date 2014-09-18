class PagesController < ApplicationController
  skip_before_filter :authorize
  
  def dashboard
    @task = Task.all
    @activities = Activity.order("created_at desc")
  end
end
