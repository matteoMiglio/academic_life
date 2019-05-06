Rails.application.routes.draw do
  get 'members/index'
  get 'groups/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_sessions#new'

  resources :users, only: [:new, :create, :show] do
    resources :courses, only: [:index, :show]
  end

  resources :user_sessions, only: [:create, :destroy]

  resources :message_boards, only: [:show] do
    resources :posts, only: [:index, :show, :create, :destroy]
    resources :groups, only: [:index, :show, :create, :destroy] do
      resources :members, only: [:index, :create, :update, :destroy]
      resources :events, only: [:show, :create, :update, :destroy]
    end
    resources :documents, only: [:index, :new, :create, :destroy]
    resources :rates, only: [:index, :create]
    resources :reviews, only: [:index, :create]
  end

  resources :comments, only: [:create, :destroy]

  resources :posts do
    resources :approvals, only: [:create, :destroy]
  end

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
end
