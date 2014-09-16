class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  validates :email, uniqueness: true
  validates :email, :password, :password_confirmation, presence: true

  has_secure_password
end
