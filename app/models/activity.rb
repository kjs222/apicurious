class Activity < OpenStruct

  def self.service(user)
    @@service ||= ActivityService.new(user)
  end

  def self.user_activity(current_user)
    activity_hash = service(current_user).get_user_activity
    activity_hash.map {|activity| Activity.new(activity)}
  end

  def self.other_users_activity(current_user)
    activity_hash = service(current_user).get_other_users_activity
    activity_hash.map {|activity| Activity.new(activity)}
  end

end
