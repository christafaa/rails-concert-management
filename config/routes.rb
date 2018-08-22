Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "application#home"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
