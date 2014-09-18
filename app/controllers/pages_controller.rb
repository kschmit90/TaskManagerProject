class PagesController < ApplicationController
  skip_before_filter :authorize
  def home
    @user = User.new
  end
  def dashboard
    @task = Task.new
    @tasks = Task.all
    @activities = Activity.order("created_at desc")
  end
end
