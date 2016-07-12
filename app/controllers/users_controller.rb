class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    #how can i change this so i just pass one thing...
    @followers = AssociatedUser.followers(current_user)
    @following = AssociatedUser.following(current_user)
  end

end