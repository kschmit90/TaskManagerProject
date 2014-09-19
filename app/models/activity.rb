class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  attr_accessible :action, :trackable
  
  def self.delete_tracked_activities(trackable_type, trackable_id)
    where(trackable_type: trackable_type, trackable_id: trackable_id).delete_all
  end
  
  def self.delete_tracked_users(user_id)
    where(:user_id => user_id).delete_all
  end
end
