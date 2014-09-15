class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  validates :email, uniqueness: ture
  validates :email, :password, :password_confirmation, pressence: true
  
  
  has_secure_password
end
