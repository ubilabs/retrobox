Retrobox::Application.routes.draw do
  opinio_model

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :admin
  resources :notes, :only => :index
  resources :green_notes do
    opinio
  end
  resources :red_notes do
    opinio
  end

  root :to => "home#index"
end
