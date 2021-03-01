Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :recruiters
  
  # resources :recruiters, only: [:index, :new, :create, :show]
end
