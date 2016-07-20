class FriendshipsController < ApplicationController

  def create
    user = current_user
    friend = User.find_by username: params[:requested_friend]
    Friendship.request user, friend
  end

  def accept
    user = current_user
    friend = User.find_by username: params[:accepted_friend]
    binding.pry
    Friendship.accept user, friend
  end


  private

    def approved_params
      params.permit :requested_friend, :accepted_friend
    end
end
