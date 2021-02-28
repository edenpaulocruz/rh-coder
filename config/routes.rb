Rails.application.routes.draw do
  devise_for :recruiters
  root 'home#index'
  resources :recruiters, only: [:index, :new, :create, :show]
end
