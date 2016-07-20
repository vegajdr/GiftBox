require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  render_views

  it "responds with user profile information" do
    user = create :user
    sign_in user

    response = get :show, username: user.username

    response = JSON.parse response.body

    expect(response['user']['first_name']).to eq user.first_name
    expect(response['user']['last_name']).to eq user.last_name
  end

end
