Rails.application.routes.draw do
  root to: 'messages#index'

  resources :messages
  # get "/test", to: "messages#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
