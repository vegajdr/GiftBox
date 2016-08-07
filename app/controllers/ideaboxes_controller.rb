class IdeaboxesController < ApplicationController
  before_action :json_format

  def show
    @ideabox = ideabox_search
  end

  def create
    @ideabox = ideabox_search
    @ideabox.ideas.create! text: params[:text]
    render json: @ideabox.ideas, status: :ok
  end

  def destroy
    ideabox = ideabox_search
    if ideabox
      params[:cleared_ideas].each do |id|
        idea = ideabox.ideas.find id
        idea.destroy
      end
      render json: { status: 'Ideas has been deleted' }, status: :ok
    else
      render json: { error: 'You are not authorized to delete this record' }, status: :forbidden
    end
  end

  private

  def ideabox_search
    Ideabox.where(user: current_user, friend: search_user).first
  end
end
