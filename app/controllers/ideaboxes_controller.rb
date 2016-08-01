class IdeaboxesController < ApplicationController
  before_action :json_format

  def show
    @ideabox = Ideabox.where(user: current_user, friend: search_user).first
  end

  def create
    @ideabox = Ideabox.where(user: current_user, friend: search_user).first
    @ideabox.ideas.create! text: params[:text]
    render json: @ideabox.ideas, status: :ok
  end

end
