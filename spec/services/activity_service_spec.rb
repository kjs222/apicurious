require 'rails_helper'

describe ActivityService do

  before(:each) do
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
    @service = ActivityService.new(user)
  end

  context '#activity' do
    it "returns a list of activity for the current user" do
      VCR.use_cassette("my_activity") do
        activities = @service.get_user_activity
        activity = activities.first

        expect(activities.count).to eq(30)
        expect(activity["repo"]["name"]).to eq("kjs222/NEW")
      end
    end


    it "returns a list of activity for the current user's following users" do
      VCR.use_cassette("other_activty") do
        activities = @service.get_other_users_activity
        activity = activities.last
        expect(activities.count).to eq(60)
        expect(activity["repo"]["name"]).to eq("icorson3/the_pivot")
      end
    end

  end
end
