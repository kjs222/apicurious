module Parser
  def parse(response)
    JSON.parse(response.body)
  end
end
