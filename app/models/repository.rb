class Repository < OpenStruct

  def self.service(user)
    @@service ||= GithubService.new(user)
  end

  def self.starred_repos(user)
    starred_repos_hash = service(user).get_starred_repos
    starred_repos_hash.map {|repo| Repository.new(repo)}
  end

  def self.user_repos(user)
    user_repos_hash = service(user).get_user_repos
    user_repos_hash.map {|repo| Repository.new(repo)}
  end
  


end
