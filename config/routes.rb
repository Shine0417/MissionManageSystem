Rails.application.routes.draw do
  resource :session, only: %w[new create destroy]
  scope :admin do
    resources :users, except: :new
  end
  resources :users, only: :new
  resources :missions
  
  root "sessions#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
