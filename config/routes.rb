TaskManagerProject::Application.routes.draw do
  root :to => 'pages#home'
  
  # Login/Logout Routes
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"
  
  resources :users, :tasks, :categories
end
