def add_result(race, group_name, user_name, city_name, team_name, *results)
  add_result(race, group_name, user_name, city_name, team_name, results)
end

def add_result(race, group_name, user_name, city_name, team_name, results = [] of String)
  results_array = results.to_a
  all_result = results_array.shift
  result_attrs = {user_id: USERS[user_name], race_id: race.id, city_id: CITIES[city_name], team_id: TEAMS[team_name], time: all_result}.to_h
  result_attrs.merge!({group_id: GROUPS[group_name]}.to_h) if group_name
  result = Result.create result_attrs

  results_array.each_with_index do |res, i|
    ResultRaceDiscipline.create(result_id: result.id, race_discipline_id: race.race_disciplines[i].id, position: i, time: res)
  end
end

def relative_to_absolute(*results)
  [results.last, results.first] + results.to_a.rotate.map_with_index do |e, i|
    if e != nil && results[i] != nil
      (Time.parse(e.as(String), "%X", Time::Location::UTC) - Time.parse(results[i].as(String), "%X", Time::Location::UTC)).to_s
    else
      nil
    end
  end[0...results.size - 1]
end

def delete_all_info
  [
    "users",
    "result_race_disciplines",
    "race_disciplines",
    "disciplines",
    "results",
    "races",
    "teams",
    "cities",
    "groups",
  ].each do |table_name|
    Jennifer::Adapter.adapter.truncate(table_name)
    Jennifer::Adapter.adapter.exec("ALTER SEQUENCE \"#{table_name}_id_seq\" RESTART WITH 1;")
  end
end
