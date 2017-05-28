Rails.application.routes.draw do
  post 'api/login' => 'user_token#create'
  get 'api/login' => "login#index"
  # post 'api/login' => "login#create"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
