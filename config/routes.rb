Rails.application.routes.draw do
  get 'shops/create'
  get 'shops/destroy'
  resources :parties
  root to: 'parties#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
