require 'rails_helper'

RSpec.feature "logged in user sees correct info on home" do
  scenario "structure of page is correct" do
    stub_omniauth
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "https://avatars.githubusercontent.com/u/11400778?v=3")
    visit root_path

    click_on "Sign in with Github"
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.nickname)
    expect(page).to have_link("Repos")
    expect(page).to have_link("My Commits")
    expect(page).to have_link("Other People's Commits")
    expect(page).to have_link("Open Pull Requests")
    expect(page).to have_button("Create Repo")



  end
end


# visit root_path
#
# click_on "Sign in with Github"
# VCR.use_cassette 'repos' do
#   VCR.use_cassette 'my_activity' do
#     VCR.use_cassette 'other_activity' do
#       VCR.use_cassette 'followers' do
#         VCR.use_cassette 'following' do
#           VCR.use_cassette 'starred' do
#           end
#         end
#       end
#     end
#   end
# end
