require 'rails_helper'

describe RepoService do

  before(:each) do
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
    @service = RepoService.new(user)
  end

  context '#starred_repos' do
    it "returns a list of starred repos for the current user" do
      VCR.use_cassette("starred") do
        starred_repos = @service.get_starred_repos
        starred_repo = starred_repos.first

        expect(starred_repos.count).to eq(1)
        expect(starred_repo["full_name"]).to eq("MsJennyGiraffe/mix_master")
      end
    end
  end

  context '#user_repos' do
    it "returns a list of current user's repos" do
      VCR.use_cassette("repos") do
        repos = @service.get_user_repos
        repo = repos.first

        expect(repos.count).to eq(30)
        expect(repo["full_name"]).to eq("bethsebian/affordable-housing-app")
      end
    end
  end
end
