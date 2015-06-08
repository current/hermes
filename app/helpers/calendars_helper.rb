module CalendarsHelper
  def select_by_hour(hour, collection)
    collection.select { |i| i.begin_at.hour == hour }
  end
end
