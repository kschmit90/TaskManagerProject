class UsersController < ApplicationController
  def new
      @user = User.new
    end
  
    def create
      @user = User.new(params[:user])
    
      if @user.save
        redirect_to user_path
      else
        raise "User could not be saved."
      end
    
      # Process the form submission to - hopefully - create a new user.
    end
end
