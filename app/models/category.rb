class Category < ActiveRecord::Base
  attr_accessible :description, :name
  has_and_belongs_to_many :tasks, :uniq => true
  
  # validates_uniqueness_of :task_id, :scope => [:category_id]
end
