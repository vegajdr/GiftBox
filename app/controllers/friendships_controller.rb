class FriendshipsController < ApplicationController
  before_action :json_format

  def show
    @user = current_user
    @pending = @user.pending_friendships.map { |f| f.friend }
    @requested = @user.requested_friendships.map { |f| f.friend }
  end

  def create
    friendship_status request: params[:requested_friend]
  end

  def accept
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
      unless friend
        return user_not_found_response
      end

      if params_options[:request]
        Friendship.request current_user, friend
        render json: { status: "You have requested #{friend.username} as your friend"}
      elsif params_options[:accept]
        Friendship.accept current_user, friend
        # An ideabox gets created upon friend acceptance:
        # Ideabox.where(user: current_user, friend: friend).first_or_create!
        # Ideabox.where(user: friend, friend: current_user).first_or_create!
        Ideabox.generate current_user, friend

        render json: { status: "You have accepted #{friend.username} as your friend"}
      elsif params_options[:unfriend] || params_options [:deny]
        Friendship.remove_friend current_user, friend
        render json: { status: "You have unfriended #{friend.username}"}
      end

    end

end
