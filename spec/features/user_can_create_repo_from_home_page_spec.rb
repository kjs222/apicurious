require 'rails_helper'

RSpec.feature "user can create a repo from home page" do
  #to allow visit external page, but need to add gem...
  # before do
  #   Capybara.current_driver = :selenium
  # end

  xscenario "new repo shows on github" do

    stub_omniauth
    user = User.create(uid: 1, name: "Kerry", nickname: "kjs222", token: ENV['GITHUB_TOKEN'], image: "https://avatars.githubusercontent.com/u/11400778?v=3")
    visit root_path

    click_on "Sign in with Github"
    new_repo_name = "Test-#{rand(1..10000)}"
    fill_in "repo_name", with: new_repo_name
    click_on "Create Repo"
    #this fails because capybara wont let visit ot external page
    #but also think the test is failing...
    visit "https://github.com/kjs222?tab=repositories"
    expect(page).to have_content(new_repo_name)

  end
end
