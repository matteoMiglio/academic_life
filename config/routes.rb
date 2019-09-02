Rails.application.routes.draw do
  get 'user_groups/index'
  get 'user_documents/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_sessions#new'

  resources :notifications, only: [:index, :show, :destroy]

  resources :users, only: [:show] do
    resources :courses, only: [:index, :show]
    resources :events, only: [:index]
    resources :user_documents, only: [:index]
    resources :user_groups, only: [:index]
  end

  resources :user_sessions, only: [:create, :destroy]

  resources :message_boards do
    resources :posts, only: [:index, :show, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
    resources :groups, only: [:index, :show, :create, :destroy] do
      resources :members, only: [:index, :create, :update, :destroy]
      resources :events, only: [:new, :create, :destroy]
    end
    resources :documents, only: [:index, :new, :create, :destroy]
    resources :rates, only: [:index, :create]
    resources :reviews, only: [:index, :create]
  end

  resources :posts do
    resources :approvals, only: [:create, :destroy]
  end

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in

  get 'errors/access_denied'
  get 'errors/record_not_found'
end
