struct Time
  def +(right : Time)
    seconds = second + right.second
    result_seconds, acc_minute = if seconds > 60
                                   [seconds - 60, 1]
                                 else
                                   [seconds, 0]
                                 end
    minutes = minute + right.minute + acc_minute
    result_minutes, acc_hour = if minutes > 60
                                 [minutes - 60, 1]
                               else
                                 [minutes, 0]
                               end
    result_hours = hour + right.hour + acc_hour
    Time.parse "#{result_hours}:#{result_minutes}:#{result_seconds}", "%X", Time::Location::UTC
  end
end
