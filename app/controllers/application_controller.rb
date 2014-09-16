class ApplicationController < ActionController::Base
  # before_filter :authorize
  protect_from_forgery

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def authorize
    if current_user.nil?
      redirect_to login_path
    end
  end

  helper_method :current_user
end