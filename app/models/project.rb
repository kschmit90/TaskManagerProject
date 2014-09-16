class Project < ActiveRecord::Base
  attr_accessible :deadline, :description, :name
end
