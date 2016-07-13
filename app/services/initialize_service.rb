class InitializeService
  def initialize(user)
    @user = user
    @connection = Faraday.new('https://api.github.com')
    @connection.headers["Authorization"] = "Token #{@user.token}"
  end
end
