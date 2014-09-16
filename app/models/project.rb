class Project < ActiveRecord::Base
  attr_accessible :deadline, :description, :name
  
  has_many :tasks
end
