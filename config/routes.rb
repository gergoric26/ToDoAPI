Rails.application.routes.draw do
  
  root 'home#index'

  get 'home/index'

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end
  end

  resources :lists, only: [] do
    resources :items, only: [:create, :destroy]
  end

end
