Retrobox::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :notes, :only => :index
  resources :green_notes
  resources :red_notes
  resources :admin

  root :to => "home#index"
end
