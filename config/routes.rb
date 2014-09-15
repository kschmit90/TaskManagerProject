TaskManagerProject::Application.routes.draw do
<<<<<<< HEAD
  get "logout" => 'logins#destroy', :as => "logout"
  
  get "login" => 'logins#new', :as => "login"
  post "login" => 'logins#create', :as => "create_login"

=======
>>>>>>> 0025b7816b1c2af044f7a3ee8107a16b0efceea5
  resources :users
  resources :tasks
end
