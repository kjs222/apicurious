require 'rails_helper'

describe IssueService do

  before(:each) do
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
    @service = IssueService.new(user)
  end

  context '#issue' do
    it "returns a list of issues for the current user" do
      VCR.use_cassette("issues") do
        issues = @service.get_issues
        issue = issues.first

        expect(issues.count).to eq(60)
        expect(issue["title"]).to eq("Debug google key issues")
      end
    end


  end
end
