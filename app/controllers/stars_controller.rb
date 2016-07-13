class StarsController <ApplicationController

  def index
    @starred_repos = Repository.starred_repos(current_user)
  end

end
