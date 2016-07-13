module ApplicationHelper

  def days_from_today(date)
    distance_of_time_in_words(Date.today, date)
  end

  def commit_link(activity)
    link_to activity.repo['name'],"https://github.com/#{activity.repo['name']}/commits?author?#{activity.actor['login']}", class: "repo-links"
  end

  def commit_message(activity)
    activity.payload["commits"].first["message"]
  end

end
