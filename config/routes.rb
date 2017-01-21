Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups do
    resources :messages
  end
end
