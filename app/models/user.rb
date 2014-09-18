class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name
  
  has_and_belongs_to_many :tasks
  has_many :comments
  has_many :activities
  
  validates :email, uniqueness: true
  validates :email, :password, :password_confirmation, :name, presence: true

  has_secure_password
end
