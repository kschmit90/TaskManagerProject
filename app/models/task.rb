class Task < ActiveRecord::Base
  attr_accessible :complete, :deadline, :name
  
  scope :is_complete, where(:complete => true)
  
  validate :deadline_is_date?
  
  belongs_to :project
  
  # Changes the boolean saved in the "complete" column to a more user-friendly string
  #
  # Returns a user-friendly string describing whether the task is stored as complete or not
  def completed
    if complete == true
      "complete"
    else
      "not complete"
    end
  end

  # Validates that the user's input for deadline is a valid date
  #
  # Returns an error if it is not a valid date, otherwise it allows the new task to be created
  def deadline_is_date?
    if !deadline.is_a?(Date)
      errors.add(:deadline, 'must be a valid date') 
    end
  end
  
end