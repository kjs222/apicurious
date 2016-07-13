class AssociatedUserService < InitializeService

  include Parser

  def get_folllowers
    response = @connection.get('user/followers')
    parse(response)
  end

  def get_folllowing
    response = @connection.get('user/following')
    parse(response)
  end

end
