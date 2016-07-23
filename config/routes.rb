Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # post "/login" => "profiles#login"
  # post "/test" => "profiles#test"
  get '/users' => 'users#index'

  scope path: ":username" do
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
  end

end
