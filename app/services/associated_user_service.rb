class AssociatedUserService < InitializeService

  include Parser

  def get_followers
    response = @connection.get('user/followers')
    parse(response)
  end

  def get_following
    response = @connection.get('user/following')
    parse(response)
  end

end
