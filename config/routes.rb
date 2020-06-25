Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :keywords, only: [:create, :new, :index, :destroy] do
    member do
      get :tweets
      get :refresh_tweets
    end
  end
  resources :tweets, only: [:destroy] do
    member do
      get :like
      get :liked_tweets
    end
  end
  get "/dashboard", to: "pages#dashboard"
end
