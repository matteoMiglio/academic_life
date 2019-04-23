Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_sessions#new'

  resources :users, only: [:new, :create, :show] do
    resources :courses, only: [:index, :show]
  end

  resources :user_sessions, only: [:create, :destroy]

  resources :message_boards, only: [:show] do
    resources :posts, only: [:index, :show, :create, :destroy]
    resources :documents
  end

  resources :comments, only: [:create, :destroy]

  resources :posts do
    resources :approvals, only: [:create, :destroy]
  end

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
end
