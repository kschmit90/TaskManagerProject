TaskManagerProject::Application.routes.draw do
  root :to => 'pages#home'
  
  get "dashboard" => 'pages#dashboard', :as => "dashboard"
  
  # Login/Logout Routes
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"
  
  post "/tasks/:id/add-category" => 'tasks#add_category', :as => "add_category"
  post "/tasks/:id/add-user" => 'tasks#add_user', :as => "add_user"
  
  post "/tasks/:id/add-user" => 'tasks#add_user', :as => "add_user"
  
  post "/tasks/:id/add-comment" => 'tasks#add_comment', :as => "add_comment"
  
  resources :users, :tasks, :categories, :projects
end
