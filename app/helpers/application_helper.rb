module ApplicationHelper

  def days_from_today(date)
    distance_of_time_in_words(Date.today, date)
  end

end
