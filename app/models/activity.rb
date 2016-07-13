class Activity < OpenStruct

  def self.service(user)
    @@service ||= ActivityService.new(user)
  end

  def self.user_activity(current_user)
    activity_hash = service(current_user).get_user_activity
    activity_objects = activity_hash.map {|activity| Activity.new(activity)}
    self.sorted_push_activities(activity_objects)
  end

  def self.other_users_activity(current_user)
    activity_hash = service(current_user).get_other_users_activity
    activity_objects = activity_hash.map {|activity| Activity.new(activity)}
    self.sorted_push_activities(activity_objects)
  end

  def self.sorted_push_activities(activity_array)
    pushes = activity_array.find_all{|obj| obj[:type] == "PushEvent"}
    pushes.sort_by {|activity| activity[:created_at]}.reverse
  end

end
