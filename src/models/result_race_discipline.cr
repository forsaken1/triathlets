class ResultRaceDiscipline < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    result_id: Int32,
    race_discipline_id: Int32,
    time: {type: String, null: true},
    position: {type: Int32, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  belongs_to :race_discipline, RaceDiscipline
  belongs_to :result, Result

  def speed(_race_discipline)
    unless time.nil?
      t = Time.parse time.as(String), "%X", Time::Location::UTC
      seconds = t.time_of_day.total_seconds
      case _race_discipline.discipline!.name
      when "swim"
        seconds_at_100m = seconds / _race_discipline.distance / 10
        "#{(seconds_at_100m / 60).to_i}:#{Calculate.two_digits seconds_at_100m.to_i % 60} мин/100 м"
      when "bicycle"
        hour_f = seconds / 3600
        speed = _race_discipline.distance / hour_f
        "#{speed.round 2} км/ч"
      when "run"
        seconds_at_km = seconds / _race_discipline.distance
        "#{(seconds_at_km / 60).to_i}:#{Calculate.two_digits seconds_at_km.to_i % 60} мин/км"
      when "transit", "penalty"
        "-"
      else
        hour_f = seconds / 3600
        speed = _race_discipline.distance / hour_f
        "#{speed.round 2} км/ч"
      end
    else
      "-"
    end
  end

  def time_format
    time.nil? ? "-" : time
  end

  def <=>(right : ResultRaceDiscipline)
    if !time.nil? && !right.time.nil?
      left_time = Time.parse time.as(String), "%X", Time::Location::UTC
      right_time = Time.parse right.time.as(String), "%X", Time::Location::UTC
      if left_time > right_time
        -1
      elsif left_time < right_time
        1
      else
        0
      end
    else
      0
    end
  end
end
