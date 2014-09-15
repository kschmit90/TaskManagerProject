TaskManagerProject::Application.routes.draw do
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"
  
  root :to => 'pages#home'

  resources :users
  resources :tasks
end
