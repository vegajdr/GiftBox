class FriendshipsController < ApplicationController

  def index
    @user = search_user
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
