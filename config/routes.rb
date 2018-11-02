Rails.application.routes.draw do
  get 'courses/index'
  get 'courses/show'
  get 'user/new'
  get 'user/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_sessions#new'

  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:create, :destroy]
  resources :courses, only: [:index, :show]

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
end
