Rails.application.routes.draw do
  root 'home#index'
  resources :jobs, :employers, :candidates
end
