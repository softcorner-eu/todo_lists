Rails.application.routes.draw do
  scope '/' do
    resources :todo_lists
  end
end
