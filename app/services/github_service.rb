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

  def get_starred_repos
    response = @connection.get('user/starred')
    parse(response)
  end

  def get_user_repos
    response = @connection.get('user/repos')
    parse(response)
  end

  def get_user_activity
    response = @connection.get("users/#{@user.nickname}/events")
    parse(response)
  end

  def get_other_users_activity

    other_users = get_folllowing

    other_users.map do |user|
      parse(@connection.get("/users/#{user['login']}/events"))
    end.flatten
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
