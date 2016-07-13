class OrganizationService < InitializeService
  include Parser

  def get_organizations
    response = @connection.get("users/#{@user.nickname}/orgs")
    parse(response)
  end

end
