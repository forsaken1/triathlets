def add_race_17_09_2016
  race = Race.create title: "Спринт-триатлон в Уссурийске на базе Южная", date: "17.09.2016"

  RaceDiscipline.create race_id: race.id, discipline_id: SWIM.id, position: 1, distance: 0.5.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: TRANSIT.id, position: 2, distance: 0.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: BICYCLE.id, position: 3, distance: 20.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: TRANSIT.id, position: 4, distance: 0.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: RUN.id, position: 5, distance: 5.0.to_f32

  add_result(race, nil, "Коноплин Александр", "Артем", "Лично", "1:21:10", "0:12:50", "0:02:10", "0:42:23", "0:02:17", "0:21:30")
  add_result(race, nil, "Фролов Денис", "Уссурийск", "Лично", "1:30:55", "0:16:30", "0:03:49", "0:43:31", "0:02:36", "0:24:29")
  add_result(race, nil, "Дубовский Игорь", "Владивосток", "Лично", "1:33:09", "0:12:49", "0:04:22", "0:47:59", "0:03:00", "0:24:59")
  add_result(race, nil, "Галаган Александр", "Владивосток", "Лично", "1:35:59", "0:13:07", "0:03:31", "0:48:32", "0:02:55", "0:27:54")
  add_result(race, nil, "Помазенков Дмитрий", "Владивосток", "Лично", "1:36:18", "0:14:10", "0:03:20", "0:52:52", "0:02:17", "0:23:39")
  add_result(race, nil, "Сакнаев Евгений", "Владивосток", "Лично", "1:40:39", "0:14:35", "0:02:47", "0:52:47", "0:02:36", "0:27:54")
  add_result(race, nil, "Послушаев Александр", "Владивосток", "Лично", "1:45:41", "0:11:50", "0:04:12", "1:02:28", "0:02:16", "0:24:55")
  add_result(race, nil, "Крылов Алексей", "Владивосток", "XC TRAINING", "1:47:57", "0:21:10", "0:04:51", "0:50:49", "0:02:40", "0:28:27")
  add_result(race, nil, "Галендухин Сергей", "Владивосток", "Лично", "1:55:12", "0:18:40", "0:04:02", "0:57:38", "0:03:51", "0:31:01")
end
