class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name
  
  has_and_belongs_to_many :tasks
  has_many :comments
  has_many :activities
  
  validates :email, uniqueness: true
  validates :email, :password, :password_confirmation, :name, presence: true

  has_secure_password
  
  def send_task_email(task)
    Pony.mail({
      :to => email,
      :from => 'rpjktest.email@gmail.com',
      :subject => 'hi ' + name,
      :body => 'Hello there ' + name + ' your task is ' + task.name,
      :via => :smtp,
      :via_options => {
        :host => ''
        :address => 'smtp.gmail.com',
        :port => '587',
        :authentication => :plain,
        :user_name => ENV['GMAIL_SMTP_USER'],
        :password => ENV['GMAIL_SMTP_PASSWORD']
      }
    })
  
  end
  
end
