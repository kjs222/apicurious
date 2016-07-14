require 'rails_helper'

describe Issue do

  before(:each) do
    @user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
  end

  context '.issues' do
    it "returns a list of open issues for the current user" do
      VCR.use_cassette("issues") do
        issues = Issue.issues(@user)
        expect(issues.first).to be_an_instance_of(Issue)
        expect(issues.first).to respond_to(:number)
        expect(issues.first).to respond_to(:state)
      end
    end
  end

  context '.pull_requests' do
    it "returns a list of issues that are prs" do
      VCR.use_cassette("issues") do
        prs = Issue.pull_requests(@user)
        expect(prs.count).to eq(19)
        expect(prs.first.title).to eq("Update 06-30-16-thursday-agenda.md")
      end
    end
  end


end
