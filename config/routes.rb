TaskManagerProject::Application.routes.draw do
  root :to => 'pages#home'
  
  # email Routes
  get "email" => 'emails#new', :as => "new_email"
  post "email" => 'emails#create'
  
  # Login/Logout Routes
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"
  
  resources :users, :tasks, :categories, :projects
end
