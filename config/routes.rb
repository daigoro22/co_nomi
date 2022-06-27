Rails.application.routes.draw do
  resources :parties do
    resources :shops
  end
  root to: 'parties#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
