Retrobox::Application.routes.draw do
  opinio_model

  root :to => "home#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :admin do
    get :finish, :on => :collection
  end
  resources :notes, :only => :index
  resources :green_notes do
    opinio
  end
  resources :red_notes do
    opinio
  end
end
