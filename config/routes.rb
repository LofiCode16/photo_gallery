Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :comments, only: [:create, :destroy]
  resources :photos, only: %i[index show new create destroy]
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: "photos#index"
end
