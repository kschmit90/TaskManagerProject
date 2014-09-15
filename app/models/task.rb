class Task < ActiveRecord::Base
  attr_accessible :complete, :deadline, :name
end
