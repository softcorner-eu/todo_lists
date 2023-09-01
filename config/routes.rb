Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items, only: [:new, :create]
  end
  resources :tags, only: [:destroy]
  root "todo_lists#index"
end
