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
      flash[:alert] = "Your username and/or password are not correct."
      render "new" 
    end
  end
  
  def destroy
    session[:user_id] = nil # Could also call `reset_session` to clear the entire session.
    flash[:notice] = "You have successfully Logged out!"
    redirect_to root_path
  end  
end
