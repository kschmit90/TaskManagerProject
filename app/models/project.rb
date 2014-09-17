class Project < ActiveRecord::Base
  attr_accessible :deadline, :description, :name, :complete
  
  scope :is_complete, where(:complete => true)
  scope :is_not_complete, where(:complete => false)
  
  validates :name, presence: true
  validate :deadline_is_date?
  
  has_many :tasks
  
  # Changes the boolean saved in the "complete" column to a more user-friendly string
  #
  # Returns a user-friendly string describing whether the project is stored as complete or not
  def completed
    if complete == true
      "complete"
    else
      "not complete"
    end
  end

  # Validates that the user's input for deadline is a valid date
  #
  # Returns an error if it is not a valid date, otherwise it allows the new project to be created
  def deadline_is_date?
    if !deadline.is_a?(Date)
      errors.add(:deadline, 'must be a valid date') 
    end
  end
  
  def to_param
    "#{id}-#{slug}"
  end
  
  def slug
    name.downcase.gsub(" ", "-")
  end  
end
