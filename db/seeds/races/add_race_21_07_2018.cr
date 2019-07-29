def add_race_21_07_2018
  race = Race.create title: "Спринт-триатлон на острове Русском", date: "21.07.2018"

  RaceDiscipline.create race_id: race.id, discipline_id: SWIM.id, position: 1, distance: 0.75.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: TRANSIT.id, position: 2, distance: 0.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: BICYCLE.id, position: 3, distance: 20.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: TRANSIT.id, position: 4, distance: 0.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: RUN.id, position: 5, distance: 5.0.to_f32

  add_result(race, "Мужчины Шоссе", "Чахлов Алексей", "Владивосток", "Грибановка", "1:12:40", "0:16:50", "0:01:01", "0:33:19", "0:00:33", "0:20:55")
  add_result(race, "Мужчины Шоссе", "Чахлов Алексей", "Владивосток", "Грибановка", "1:12:40", "0:16:50", "0:01:01", "0:33:19", "0:00:33", "0:20:55")
end
