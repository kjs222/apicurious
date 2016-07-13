class FollowingsController < ApplicationController

  def index
    @following = AssociatedUser.following(current_user)
  end

end
