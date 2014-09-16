TaskManagerProject::Application.routes.draw do
  root :to => 'pages#home'
  
  # Login/Logout Routes
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"
  
  post "/tasks/:id/add-category" => 'tasks#add_category', :as => "add_category"
  
  resources :users, :tasks, :categories, :projects
end
