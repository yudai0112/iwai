Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders,only: [:index, :create]
    get '/likes',to: 'likes#create'
    delete '/likes',to: 'likes#destroy'
  end
end

