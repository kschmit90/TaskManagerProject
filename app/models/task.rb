class Task < ActiveRecord::Base
  attr_accessible :complete, :deadline, :name
  
  scope :is_complete, where(:complete => true)
  
  def completed
    if complete == true
      "complete"
    else
      "not complete"
    end
  end
  
end