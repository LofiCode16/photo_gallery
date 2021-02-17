Rails.application.routes.draw do
  get 'photos/index'
  get 'photos/:id', to: 'photos#show', as: 'photo'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "photos#index"
end
