class EmailsController < ApplicationController
  skip_before_filter :authorize
 
  def new
   
  end
  
  def create
    binding.pry
    @email = Pony.mail(:to => params[:to], :from => 'rpjktest.email@gmail.com', :subject => "You have been assigned a task!" :body => '<%= link_to ("Click here to see your task."), tasks_path %>')
     if @email
       redirect_to user_path
     else
       render "new"
     end
      
  end
end
