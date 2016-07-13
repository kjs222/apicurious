class ActivityService < InitializeService
  include Parser

  def get_user_activity
    response = @connection.get("users/#{@user.nickname}/events")
    parse(response)
  end

  def get_other_users_activity
    other_users = AssociatedUser.following(@user)
    other_users.map do |user|
      parse(@connection.get("/users/#{user['login']}/events"))
    end.flatten
  end

end
