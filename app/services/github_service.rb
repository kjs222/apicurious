class GithubService

  def initialize(user)
    @user = user
    @connection = Faraday.new('https://api.github.com')
    @connection.headers["Authorization"] = "Token #{@user.token}"
  end

  def get_folllowers
    response = @connection.get('user/followers')
    parse(response)
  end

  def get_folllowing
    response = @connection.get('user/following')
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
