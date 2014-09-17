class Comment < ActiveRecord::Base
  attr_accessible :comment_text, :task_id, :user_id
  
  belongs_to :user
  belongs_to :task
  
  validates :user_id, presence: true
  validates :task_id, presence: true
  validates :comment_text, presence: true
  
end
