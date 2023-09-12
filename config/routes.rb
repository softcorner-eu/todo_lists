Rails.application.routes.draw do
  resources :lists do
    resources :items, only: [:new, :create]
  end
  resources :tags, only: [:destroy]
  root "lists#index"
end
