class IssueService < InitializeService
  include Parser

  def get_issues
    response = @connection.get("user/issues?filter=all&per_page=100")
    parse(response)
  end

end
