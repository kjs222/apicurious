class Organization < OpenStruct

  def self.service(user)
    @@service ||= GithubService.new(user)
  end


  def self.organizations(user)
    organizations_hash = service(user).get_organizations
    organizations_hash.map {|organization| Organization.new(organization)}
  end


end
