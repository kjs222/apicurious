class HomesController < ApplicationController

  def show
    if current_user
      @user = User.find(current_user.id)
      @stats = Stats.new(current_user)
      @organizations = Organization.organizations(current_user)
      @repos = Repository.user_repos(current_user)
      @activities = Activity.user_activity(current_user)
      @others_activities = Activity.other_users_activity(current_user)    
    end
  end

end
