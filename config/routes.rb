Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user_sessions#new'
  resources :user_sessions
  get  'static_pages/home'
  #root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
end
