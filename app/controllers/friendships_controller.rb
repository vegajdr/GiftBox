class FriendshipsController < ApplicationController
  before_action :json_format

  def show
    @user = search_user
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


  private

    def approved_params
      params.permit :requested_friend, :accepted_friend
    end

    def search_user
      User.find_by username: params[:username]
    end

    def friendship_status params_options
      friend = User.find_by username: params_options.values.first

      if friend
        if params_options[:request]
          Friendship.request current_user, friend
          render json: { status: "You have requested #{friend.username} as your friend"}
        elsif params_options[:accept]
          Friendship.accept current_user, friend
          render json: { status: "You have accepted #{friend.username} as your friend"}
        elsif params_options[:unfriend]
          Friendship.remove_friend current_user, friend
          render json: { status: "You have unfriended #{friend.username}"}
        end
      else
        user_not_found_response
      end
    end

end
