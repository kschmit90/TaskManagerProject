class Task < ActiveRecord::Base
  attr_accessible :complete, :deadline, :name
  
  scope :is_complete, where(:complete => true)
  
  validate :deadline_is_date?
  
  def completed
    if complete == true
      "complete"
    else
      "not complete"
    end
  end
  
    private

    def deadline_is_date?
      if !deadline.is_a?(Date)
        errors.add(:deadline, 'must be a valid date') 
      end
    end
  
end