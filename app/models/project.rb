class Project < ActiveRecord::Base
  skip_before_filter :authorize
  
  attr_accessible :deadline, :description, :name
  
  validates :name, presence: true
  
  has_many :tasks
end
