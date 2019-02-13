Rails.application.routes.draw do
  resources :event
  devise_for :users
  # get 'event/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "event#index"
end
