Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "application#home"

  resources :users, only: [:new, :create, :show, :index]

  resources :concerts do
    resources :attendees, only: [:new, :create]
  end

  resources :attendees, except: [:new, :create]

  resources :sessions, only: [:new, :create]
  # possible to just do get sesson#new ?
  post '/logout', to: "sessions#destroy"

end
