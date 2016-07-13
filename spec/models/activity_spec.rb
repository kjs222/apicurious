require 'rails_helper'

describe Activity do

  before(:each) do
    @user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
  end

  context '.user_activity' do
    it "returns a list of activity objects for the current user" do
      VCR.use_cassette("my_activity") do
        activities = Activity.user_activity(@user)
        expect(activities.first).to be_an_instance_of(Activity)
        expect(activities.first).to respond_to(:type)
        expect(activities.first).to respond_to(:actor)
      end
    end
  end

  context '.other_user_activity' do
    it "returns a list of activity objects for the current user's followers" do
      VCR.use_cassette("other_activity") do
        activities = Activity.other_users_activity(@user)
        expect(activities.first).to be_an_instance_of(Activity)
        expect(activities.first).to respond_to(:type)
        expect(activities.first).to respond_to(:actor)
      end
    end
  end
end
