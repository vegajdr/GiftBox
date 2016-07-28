class IdeaboxesController < ApplicationController

  def show
    @ideabox = Ideabox.where(user: current_user, friend: search_user).first
  end

  
end
