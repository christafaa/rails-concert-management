Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "application#home"

  resources :users
  resources :concerts

  resources :sessions, only: [:new, :create]
  post '/logout', to: "sessions#destroy"

end
