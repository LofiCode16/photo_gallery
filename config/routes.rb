Rails.application.routes.draw do
  resources :photos, only: %i[index show new create destroy]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "photos#index"
end
