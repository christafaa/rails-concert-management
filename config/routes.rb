Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "application#home"

  resources :users, only: [:new, :create, :show, :index]

  resources :concerts do
    resources :attendees, only: [:create, :edit, :update]
  end

  resources :attendees, only: [:show, :index]

  resources :sessions, only: [:new, :create]
  # possible to just do get sesson#new ?
  post '/logout', to: "sessions#destroy"

  get '/auth/github/callback' => 'sessions#create_via_omniauth'

end
