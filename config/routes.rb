Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "rooms#index"
  resources :users, only: [:edit, :update] do
    resources :rooms do
      resources :post
    end
  end
  
  resources :rooms do
    resources :posts
  end
  resources :posts

  
end
