require 'rails_helper'

RSpec.describe InterestsController, type: :controller do

  it "allows users to add interests" do
    user = create :user
    sign_in user

    old_interests_count = user.interests.count

    response = post :create, name: "Cars"

    expect(user.interests.count).to eq old_interests_count + 1
    expect(user.interests.first.name).to eq "Cars"
    expect(response.status).to eq 200
  end

  it "allows users to edit interests" do
    user = create :user
    sign_in user
    interest = user.interests.create! name: "Cars"

    old_interests_count = user.interests.count

    response = put :update, name: "Sports", id: interest.id

    expect(user.interests.count).to eq old_interests_count
    expect(user.interests.first.name).to eq "Sports"
    expect(response.status).to eq 200
  end

  it "allows users to delete interests" do
    user = create :user
    sign_in user
    interest = user.interests.create! name: "Cars"

    old_interests_count = user.interests.count

    response = delete :destroy, id: interest.id

    expect(user.interests.count).to eq old_interests_count - 1
    expect(response.status).to eq 200
  end
end
