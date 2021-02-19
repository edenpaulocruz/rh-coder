Rails.application.routes.draw do
  root 'home#index'
  resources :recruiters, only: [:index, :new, :create, :show]
end
