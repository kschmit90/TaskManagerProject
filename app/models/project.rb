class Project < ActiveRecord::Base
  attr_accessible :deadline, :description, :name
  
  validates :name, presence: true
  
  has_many :tasks
end
