class AssociatedUser < OpenStruct

  def self.service(user)
    @@service ||= AssociatedUserService.new(user)
  end

  def self.followers(user)
    followers_hash = service(user).get_folllowers
    followers_hash.map {|follower| AssociatedUser.new(follower)}
  end

  def self.following(user)
    following_hash = service(user).get_folllowing
    following_hash.map {|following| AssociatedUser.new(following)}
  end

end
