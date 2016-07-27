Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users' => 'users#index'

  post '/register' => 'sessions#register'
  post '/login' => 'sessions#login'

  get '/:username/profile' => 'profiles#friend_profile'

  get '/default_interests' => 'interests#default_interests'

  resources :wishlists do
    resources :items
  end
  resource :friendships, path: :friends do
    collection do
      post :accept
      delete :unfriend
    end
  end
  resource :profile do
    post :dates
    resources :interests
    resources :holidays
  end
  resource :invitation
end
