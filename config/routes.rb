Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :tasks
  end

  get '/home' => 'home#index'
  root to: 'home#index'
end
