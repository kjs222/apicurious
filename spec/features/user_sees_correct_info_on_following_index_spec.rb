require 'rails_helper'

RSpec.feature "logged in user sees correct info on following page" do
  scenario "following page has content" do
    stub_omniauth
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "https://avatars.githubusercontent.com/u/11400778?v=3")
    visit root_path
    click_on "Sign in with Github"
    visit followings_path

    expect(page).to have_content("Following")
    expect(page).to have_link("MsJennyGiraffe")
  end
end
