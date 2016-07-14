class Issue < OpenStruct

  def self.service(user)
    @@service ||= IssueService.new(user)
  end

  def self.issues(current_user)
    issue_hash = service(current_user).get_issues
    issue_objects = issue_hash.map {|issue| Issue.new(issue)}
  end

  def self.pull_requests(current_user)
    self.issues(current_user).find_all do |issue|
      issue["pull_request"]
    end
  end


end
