require 'rails_helper'

describe Activity do

  before(:each) do
    @user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
  end

  context '.followers' do
    it "returns a list of associated user objects for the current users followers" do
      VCR.use_cassette("followers") do
        followers = AssociatedUser.followers(@user)
        expect(followers.first).to be_an_instance_of(AssociatedUser)
        expect(followers.first).to respond_to(:login)
        expect(followers.first).to respond_to(:gravatar_id)
      end
    end
  end

  context '.following' do
    it "returns a list of associated user objects for the current users followings" do
      VCR.use_cassette("following") do
        followings = AssociatedUser.following(@user)
        expect(followings.first).to be_an_instance_of(AssociatedUser)
        expect(followings.first).to respond_to(:login)
        expect(followings.first).to respond_to(:gravatar_id)
      end
    end
  end

  context '.follower_count' do
    it "returns a number of associated user objects for the current users foll0wers" do
      VCR.use_cassette("followers") do
        follower_count = AssociatedUser.followers_count(@user)
        expect(follower_count).to be(9)
      end
    end
  end

  context '.following_count' do
    it "returns a number of associated user objects for the current users followings" do
      VCR.use_cassette("following") do
        following_count = AssociatedUser.following_count(@user)
        expect(following_count).to be(2)
      end
    end
  end
end
