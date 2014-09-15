class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authorize
  
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
  helper_method :current_user
  
  def authorize
    if current_user.nil?
      redirect_to login_path
    end
  end
end
