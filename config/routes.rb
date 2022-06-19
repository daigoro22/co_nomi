Rails.application.routes.draw do
  get 'parties/index'
  get 'parties/edit'
  get 'parties/new'
  root to: 'parties#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
