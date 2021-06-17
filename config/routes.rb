Rails.application.routes.draw do
  resource :session, only: %w[new create destroy]
  namespace :admin do
    resources :users
  end
  resources :missions
  
  root "sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
