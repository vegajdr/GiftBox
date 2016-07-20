class FriendshipsController < ApplicationController
  before_action :json_format

  def index
    @user = search_user
    @pending = @user.pending_friendships.map { |f| f.friend }
    @requested = @user.requested_friendships.map { |f| f.friend }
  end

  def create
    user = current_user
    friend = User.find_by username: params[:requested_friend]
    Friendship.request user, friend
  end

  def accept
    user = current_user
    friend = User.find_by username: params[:accepted_friend]
    Friendship.accept user, friend
  end


  private

    def approved_params
      params.permit :requested_friend, :accepted_friend
    end

    def search_user
      User.find_by username: params[:username]
    end

end
