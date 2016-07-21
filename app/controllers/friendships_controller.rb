class FriendshipsController < ApplicationController
  before_action :json_format

  def index
    @user = search_user
    @pending = @user.pending_friendships.map { |f| f.friend }
    @requested = @user.requested_friendships.map { |f| f.friend }
  end

  def create
    friend = User.find_by username: params[:requested_friend]
    if friend
      Friendship.request current_user, friend
      render json: { status: "Request has been created for #{friend.username}"}
    else
      user_not_found_response
    end
  end

  def accept
    friend = User.find_by username: params[:accepted_friend]
    if friend
      Friendship.accept current_user, friend
      render json: { status: "#{friend.username} has been accepted as friend"}
    else
      user_not_found_response
    end
  end


  private

    def approved_params
      params.permit :requested_friend, :accepted_friend
    end

    def search_user
      User.find_by username: params[:username]
    end

end
