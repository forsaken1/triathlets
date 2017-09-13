require "jennifer/adapter/postgres"
require "jennifer"
require "../config/jennifer"
require "../src/models/*"

ResultRaceDiscipline.all.delete
RaceDiscipline.all.delete
Discipline.all.delete
Result.all.delete
User.all.delete
Race.all.delete
Team.all.delete

discipline1 = Discipline.create name: "swim", title: "Плавание"
discipline2 = Discipline.create name: "bicycle", title: "Велосипед"
discipline3 = Discipline.create name: "run", title: "Бег"
discipline4 = Discipline.create name: "transit", title: "Транзитка"

race1 = Race.create title: "Спринт-триатлон"

RaceDiscipline.create race_id: race1.id, discipline_id: discipline1.id, position: 1, distance: 0.75.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 2, distance: 0.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline2.id, position: 3, distance: 20.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 4, distance: 0.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline3.id, position: 5, distance: 5.0.to_f32

# ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline1.id, position: 1, time: "00:19:36")
# ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline2.id, position: 2, time: "00:02:07")
# ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline3.id, position: 3, time: "00:35:41")
# ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline4.id, position: 4, time: "00:01:58")
# ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline5.id, position: 5, time: "00:19:12")

def add_result(race, name, year, team_name, *results)
  team = Team.where { _name == team_name }.first
  team = if team.nil?
    Team.create name: team_name
  else
    team
  end
  user = User.create name: name, team_id: team.id, year: year
  result = Result.create user_id: user.id, race_id: race.id

  results.each_with_index do |res, i|
    ResultRaceDiscipline.create(result_id: result.id, race_discipline_id: race.race_disciplines[i].id, position: i, time: res)
  end
end

add_result(race1, "Алексей Чахлов", 1983, "Грибановка", "0:16:50", "0:01:01", "0:33:19", "0:00:33", "0:20:55")
add_result(race1, "Коноплин Никита", 1993, "Лично", "0:15:40", "0:01:14", "0:39:18", "0:00:47", "0:23:46")
add_result(race1, "Динмухаметов Даниил", 1992, "Грибановка", "0:14:20", "0:01:21", "0:44:30", "0:00:55", "0:21:39")
add_result(race1, "Анисимов Иван", 1979, "Лично", "0:19:50", "0:01:13", "0:36:12", "0:01:24", "0:25:53")
add_result(race1, "Пиндюрин Алексей", 1980, "Makkolli Racing Team", "0:19:40", "0:00:48", "0:36:52", "0:06:40", "0:20:50")
# add_result(race1, "", 19, "", "0:", "0:", "0:", "0:", "0:")
# add_result(race1, "", 19, "", "0:", "0:", "0:", "0:", "0:")
# add_result(race1, "", 19, "", "0:", "0:", "0:", "0:", "0:")
# add_result(race1, "", 19, "", "0:", "0:", "0:", "0:", "0:")
# add_result(race1, "", 19, "", "0:", "0:", "0:", "0:", "0:")
# add_result(race1, "", 19, "", "0:", "0:", "0:", "0:", "0:")
