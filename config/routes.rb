Rails.application.routes.draw do
  root "todo_lists#index"
  scope '/' do
    resources :todo_lists do
      resources :todo_items, only: [:new, :create]
    end
  end
end
