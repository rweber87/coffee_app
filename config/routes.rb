Rails.application.routes.draw do
  resources :coffee_statuses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'coffee_statuses/new'
end
