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

    response = delete :destroy, username: friend.username, cleared_ideas: [{ id: idea.id}]

    expect(ideabox.ideas.count).to eq old_ideas_count - 1
  end

  it "allows users to delete multiple ideas under ideabox" do
    user = create :user
    friend = create :user
    sign_in user

    ideabox = Ideabox.create! user: user, friend: friend
    idea = ideabox.ideas.create! text: "Random"
    idea1 = ideabox.ideas.create! text: "Random1"
    idea2 = ideabox.ideas.create! text: "Random2"

    old_ideas_count = ideabox.ideas.count

    response = delete :destroy, username: friend.username, cleared_ideas: [{ id: idea.id }, { id: idea1 }, { id: idea2 }]

    expect(ideabox.ideas.count).to eq old_ideas_count - 3
  end
end
