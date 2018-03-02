class FriendshipsController < ApplicationController
  before_action :json_format

  def show
    @user = current_user
    @pending = @user.pending_friendships.map(&:friend)
    @requested = @user.requested_friendships.map(&:friend)
  end

  def create
    friendship_status request: params[:requested_friend]
  end

  def accept
    # Two IdeaBoxes will be generated for friend and user on this branch
    friendship_status accept: params[:accepted_friend]
  end

  def destroy
    friendship_status unfriend: params[:removed_friend]
  end

  def deny
    friendship_status deny: params[:denied_friend]
  end

  private

  def approved_params
    params.permit :requested_friend, :accepted_friend
  end

  def friendship_status params_options
    friend = User.find_by username: params_options.values.first
    return user_not_found_response unless friend

    if params_options[:request]
      Friendship.request current_user, friend
      render json: { status: "You have requested #{friend.username} as your friend" }
    elsif params_options[:accept]
      Friendship.accept current_user, friend
      # An ideabox gets created upon friend acceptance:
      Ideabox.generate current_user, friend

      render json: { status: "You have accepted #{friend.username} as your friend" }
    elsif params_options[:unfriend] || params_options [:deny]
      Friendship.remove_friend current_user, friend
      render json: { status: "You have unfriended #{friend.username}" }
    end
  end
end
