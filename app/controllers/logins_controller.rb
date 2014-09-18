class LoginsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_email(params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil # Could also call `reset_session` to clear the entire session.
    redirect_to root_path
  end  
end
