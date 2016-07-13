class FollowersController < ApplicationController

  def index
    @followers = AssociatedUser.followers(current_user)
  end

end
