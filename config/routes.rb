Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/login" => "profiles#login"
  post "/test" => "profiles#test"

  scope path: ":username" do
    resources :friendships, path: :friends
    resource :profile
  end

  post ":username/friends/accept" => "friendships#accept"
end
