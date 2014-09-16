class Task < ActiveRecord::Base
  attr_accessible :complete, :deadline, :name, :project_id, :categories
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users
  
  scope :is_complete, where(:complete => true)
  scope :is_not_complete, where(:complete => false)
  
  validate :deadline_is_date?
  validate :name, presence: true
  
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