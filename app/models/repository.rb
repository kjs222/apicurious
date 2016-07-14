class Repository < OpenStruct

  def self.service(user)
    @@service ||= RepoService.new(user)
  end

  def self.starred_repos(user)
    starred_hash = service(user).get_starred_repos
    starred_objs = starred_hash.map {|repo| Repository.new(repo)}
  end

  def self.user_repos(user)
    repo_hash = service(user).get_user_repos
    repo_objs = repo_hash.map {|repo| Repository.new(repo)}
    repo_objs.sort_by { |k| k["pushed_at"] }.reverse
  end

  def self.starred_repos_count(user)
    self.starred_repos(user).count
  end

end
