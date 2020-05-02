Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]

  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
