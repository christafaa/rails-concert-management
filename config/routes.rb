Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'application#home'

  resources :users, only: [:new, :create, :show, :index]

  resources :concerts do
    resources :attendees, only: [:create]
    resources :tickets, only: [:create]
    resources :pieces
  end

  get '/attendees/sort', to: 'attendees#sort'

  resources :attendees, only: [:show, :index, :edit, :update]

  resources :sessions, only: [:create]

  post '/logout', to: 'sessions#destroy'

  get '/auth/github/callback' => 'sessions#create_via_omniauth'

end
