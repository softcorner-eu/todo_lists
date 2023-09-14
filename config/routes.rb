Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :todo_lists do
    resources :todo_items, only: [:new, :create]
  end
  root "todo_lists#index"
end
