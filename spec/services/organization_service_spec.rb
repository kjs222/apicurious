require 'rails_helper'

describe OrganizationService do

  before(:each) do
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "www.noimage.com", email: "notmyemail@email.com")
    @service = OrganizationService.new(user)
  end

  context "#organizations" do
    it "returns a list of organizations" do
      VCR.use_cassette("organizations") do
        organizations = @service.get_organizations
        organization = organizations.first

        expect(organizations.count).to eq(1)
        expect(organization['login']).to eq("Turing-Pahlka-Posse")
      end
    end
  end

end
