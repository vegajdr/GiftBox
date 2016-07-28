class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:register, :login]

  before_action { request.format = :json }

  def register
    @user = User.create!(
      email:        params[:email],
      password:     params[:password],
      username:     params[:username],
      first_name:   params[:first_name],
      last_name:    params[:last_name]
    )
    @token = @user.generate_token_for "Gentoo User"
  end

  def login
    @user = User.find_by email: params[:email]
    unless @user && (@user.valid_password? params[:password])
      user_not_found_response
    else
      @token = @user.auth_tokens.find_by name: "Gentoo User"
    end
  end

end
