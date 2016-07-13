require 'rails_helper'

describe AssociatedUserService do

  before(:each) do
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
    @service = AssociatedUserService.new(user)
  end

  context '#associatedusers_followers' do
    it "returns a list of followers of current user" do
      VCR.use_cassette("followers") do
        followers = @service.get_followers
        follower = followers.first

        expect(followers.count).to eq(9)
        expect(follower["login"]).to eq("dsheffield206")
      end
    end
  end

  context '#associatedusers_following' do
    it "returns a list of users the current user is following" do
      VCR.use_cassette("following") do
        followings = @service.get_following
        following = followings.first

        expect(followings.count).to eq(2)
        expect(following["login"]).to eq("MsJennyGiraffe")
      end
    end
  end
end
