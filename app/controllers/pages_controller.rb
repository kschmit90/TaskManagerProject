class PagesController < ApplicationController
  skip_before_filter :authorize
  
  def dashboard
    @tasks = User.tasks
    
  end
end
