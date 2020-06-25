Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :keywords, only: [:create, :new, :index, :destroy] do
    member do
      get :tweets
      get :refresh_tweets
    end
  end
end
