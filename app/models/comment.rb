class Comment < ActiveRecord::Base
  attr_accessible :comment_text, :task_id, :user_id
end
