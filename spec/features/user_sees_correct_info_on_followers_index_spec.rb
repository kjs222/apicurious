require 'rails_helper'

RSpec.feature "logged in user sees correct info on followers page" do
  scenario "followers page has content" do
    stub_omniauth
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "https://avatars.githubusercontent.com/u/11400778?v=3")
    visit root_path
    click_on "Sign in with Github"
    visit followers_path

    expect(page).to have_content("Followers")
    expect(page).to have_link("dsheffield206")
  end
end
