class HomesController < ApplicationController

  def show
    @user = User.find(current_user.id)
    @followers = AssociatedUser.followers_count(current_user)
    @following = AssociatedUser.following_count(current_user)
    @starred_repos = Repository.starred_repos_count(current_user)
    @repos = Repository.user_repos(current_user)
    @activities = Activity.user_activity(current_user)
    @others_activities = Activity.other_users_activity(current_user)
    @organizations = Organization.organizations(current_user)
  end

end
