Rails.application.routes.draw do
  devise_for :users
  root  "groups#index"
  resources :groups, only: [:new, :edit, :create, :update, :index] do
    resources :messages, only: [:index, :create]
  end

end
