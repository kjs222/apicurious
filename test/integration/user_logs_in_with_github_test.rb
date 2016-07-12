require "test_helper"
class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Apicurious::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Sign in with Github"
    assert_equal "/", current_path
    assert page.has_content?("Kerry")
    assert page.has_link?("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "4444",
      info: {
        name: "Kerry",
        nickname: "kerry"
            },
      credentials: {
        token: "finn"
                    },
      })
  end
end
