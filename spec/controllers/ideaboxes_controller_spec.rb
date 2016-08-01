require 'rails_helper'

RSpec.describe IdeaboxesController, type: :controller do

  it "allows user to create ideas under ideabox" do
    user = create :user
    friend = create :user
    sign_in user

    ideabox = Ideabox.create! user: user, friend: friend

    old_ideas_count = ideabox.ideas.count

    response = post :create, text: "Candles", username: friend.username
    expect(ideabox.ideas.count).to eq old_ideas_count + 1
    expect(ideabox.ideas.last.text).to eq "Candles"
  end

  it "allows users to delete ideas under ideabox" do
    user = create :user
    friend = create :user
    sign_in user

    ideabox = Ideabox.create! user: user, friend: friend
    idea = ideabox.ideas.create! text: "Random"

    old_ideas_count = ideabox.ideas.count

    response = delete :destroy, id: idea.id, username: friend.username

    expect(ideabox.ideas.count).to eq old_ideas_count - 1
  end
end
