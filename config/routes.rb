Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :appearances, only: [:create]
  resources :episodes, only: [:index, :show, :destroy]
  resources :guests, only: [:index]

end
