class Stats
  attr_reader :num_stars, :num_followers, :num_following

  def initialize(user)
    @user = user
    @num_followers =AssociatedUser.followers_count(user)
    @num_following =AssociatedUser.following_count(user)
    @num_stars = Repository.starred_repos_count(user)
  end

end
