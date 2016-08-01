Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/:username/profile' => 'profiles#friend_profile'


  resources :wishlists do
    resources :items
  end

  resource :friendships, path: :friends do
    collection do
      post :accept
      delete :unfriend
      post :deny
    end
  end

  resource :profile do
    post :dates
    resources :interests
    resources :holidays
  end

  scope "/:username" do
    resource :profile do
      resource :ideabox
    end
  end

  resource :invitation, only: [:create]

  post "/login" => 'sessions#login'
  post '/register' => 'sessions#register'

  get '/users' => 'users#index'


  get '/default_interests' => 'interests#default_interests'

  get '/:username/wishlists' => 'wishlists#friend_wishlists'



end
