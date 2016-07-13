require 'rails_helper'

describe Organization do

  before(:each) do
    @user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
  end

  context '.organizations' do
    it "returns a list of organization objects for the current user" do
      VCR.use_cassette("organizations") do
        orgs = Organization.organizations(@user)
        expect(orgs.first).to be_an_instance_of(Organization)
        expect(orgs.first).to respond_to(:login)
        expect(orgs.first).to respond_to(:repos_url)
      end
    end
  end

end
