Rails.application.routes.draw do
  resources :lists do
    resources :items, only: [:new, :create]
  end
  root "lists#index"
end
