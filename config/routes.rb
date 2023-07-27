Rails.application.routes.draw do
  scope '/' do
    resources :todo_lists
    resources :todo_items, only: [:create]
  end
end
