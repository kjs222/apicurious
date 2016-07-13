require 'rails_helper'

describe Repository do

  before(:each) do
    @user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
  end

  context '.starred_repos' do
    it "returns a list of repo objects for the current users starred repos" do
      VCR.use_cassette("starred") do
        starred = Repository.starred_repos(@user)
        expect(starred.first).to be_an_instance_of(Repository)
        expect(starred.first).to respond_to(:name)
        expect(starred.first).to respond_to(:owner)
      end
    end
  end

  context '.user_repos' do
    it "returns a list of repo objects for the current user" do
      VCR.use_cassette("repos") do
        repos = Repository.user_repos(@user)
        expect(repos.first).to be_an_instance_of(Repository)
        expect(repos.first).to respond_to(:name)
        expect(repos.first).to respond_to(:owner)
      end
    end
  end

  context '.starred_repos_count' do
    it "returns a number of starred repo objects for the current user" do
      VCR.use_cassette("starred") do
        starred_count = Repository.starred_repos_count(@user)
        expect(starred_count).to be(1)
      end
    end
  end

end
