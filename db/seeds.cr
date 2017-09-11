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

team1 = Team.create name: "Лично"
user1 = User.create name: "Ivan Ivanov", team_id: team1.id, year: 2000
race1 = Race.create title: "Спринт-триатлон"
result1 = Result.create user_id: user1.id, race_id: race1.id, position: 1

race_discipline1 = RaceDiscipline.create race_id: race1.id, discipline_id: discipline1.id, position: 1, distance: 0.75.to_f32
race_discipline2 = RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 2, distance: 0.0.to_f32
race_discipline3 = RaceDiscipline.create race_id: race1.id, discipline_id: discipline2.id, position: 3, distance: 20.0.to_f32
race_discipline4 = RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 4, distance: 0.0.to_f32
race_discipline5 = RaceDiscipline.create race_id: race1.id, discipline_id: discipline3.id, position: 5, distance: 5.0.to_f32

ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline1.id, position: 1, time: "00:19:36")
ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline2.id, position: 2, time: "00:02:07")
ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline3.id, position: 3, time: "00:35:41")
ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline4.id, position: 4, time: "00:01:58")
ResultRaceDiscipline.create(result_id: result1.id, race_discipline_id: race_discipline5.id, position: 5, time: "00:19:12")
