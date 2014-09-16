class EmailsController < ApplicationController
  def new
    @email = Email.new
  end
  
  def create
  end
end
