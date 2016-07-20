require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  render_views

  it "responds with user profile information" do
    user = create :user
    sign_in user

    response = get :show, username: user.username

    response = JSON.parse response.body

  
    binding.pry

  end

end
