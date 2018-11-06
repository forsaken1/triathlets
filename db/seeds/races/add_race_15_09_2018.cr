def add_race_15_09_2018
  race = Race.create title: "Спринт-триатлон в Уссурийске на базе Южная", date: "15.09.2018"

  RaceDiscipline.create race_id: race.id, discipline_id: SWIM.id, position: 1, distance: 0.5.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: TRANSIT.id, position: 2, distance: 0.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: BICYCLE.id, position: 3, distance: 20.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: TRANSIT.id, position: 4, distance: 0.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: RUN.id, position: 5, distance: 5.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: PENALTY.id, position: 6, distance: 0.0.to_f32

  add_result(race, "Мужчины МТБ", "Котельвин Максим", "Уссурийск", "Лично", relative_to_absolute("0:10:08", "0:11:37", "0:53:06", "0:54:30", "1:15:40"))
  add_result(race, "Мужчины МТБ", "Коноплин Александр", "Артем", "Лично", relative_to_absolute("0:11:43", "0:13:05", "0:55:20", "0:56:43", "1:16:06"))
  add_result(race, "Мужчины МТБ", "Коноплин Никита", "Артем", "Лично", relative_to_absolute("0:09:43", "0:10:53", "0:56:40", "0:58:25", "1:18:53"))
  add_result(race, "Мужчины МТБ", "Фролов Денис", "Уссурийск", "Лично", relative_to_absolute("0:13:27", "0:16:00", "1:00:40", "1:02:52", "1:24:37"))
  add_result(race, "Мужчины МТБ", "Решетняк Максим", "Уссурийск", "Лично", relative_to_absolute("0:10:10", "0:11:50", "1:01:30", "1:03:07", "1:26:00"))

  add_result(race, "Мужчины МТБ", "Мазняк Антон", "Арсеньев", "Лично", relative_to_absolute("0:14:52", "0:16:53", "1:03:00", "1:05:00", "1:26:00"))
  add_result(race, "Мужчины МТБ", "Архипов Владислав", "Уссурийск", "Лично", relative_to_absolute("0:10:00", "0:11:40", "1:02:00", "1:03:50", "1:28:48"))
  add_result(race, "Мужчины МТБ", "Дуболазов Михаил", "Владивосток", "Лично", relative_to_absolute("0:11:30", "0:14:15", "1:03:52", "1:04:35", "1:29:15"))
  add_result(race, "Мужчины МТБ", "Смычков Алексей", "Уссурийск", "Лично", relative_to_absolute("0:12:33", "0:14:49", "1:09:38", "1:11:10", "1:39:31"))
  add_result(race, "Мужчины МТБ", "Падалко Максим", "Владивосток", "Лично", relative_to_absolute("0:18:18", "0:20:10", "1:10:10", "1:12:15", "1:39:38"))

  add_result(race, "Мужчины МТБ", "Степанов Алексей", "Уссурийск", "Лично", relative_to_absolute("0:17:55", "0:20:34", "1:15:00", "1:17:18", "1:39:55"))
  add_result(race, "Мужчины МТБ", "Арахчеев Александр", "Владивосток", "Лично", relative_to_absolute("0:11:58", "0:14:45", "1:13:32", "1:17:18", "1:40:11"))
  add_result(race, "Мужчины МТБ", "Калина Павел", "Владивосток", "Лично", relative_to_absolute("0:11:44", "0:13:40", "1:15:39", "1:17:05", "1:40:50"))
  add_result(race, "Мужчины МТБ", "Сальников Денис", "Уссурийск", "Лично", relative_to_absolute("0:13:04", "0:17:35", "1:15:47", "1:17:30", "1:41:10"))
  add_result(race, "Мужчины МТБ", "Мичуров Илья", "Уссурийск", "Лично", relative_to_absolute("0:16:16", "0:19:46", "1:16:40", "1:18:14", "1:41:10"))

  add_result(race, "Мужчины МТБ", "Сорокин Роман", "Уссурийск", "Лично", relative_to_absolute("0:12:35", "0:15:43", "1:15:42", "1:17:46", "1:42:18"))
  add_result(race, "Мужчины МТБ", "Никольский Андрей", "Владивосток", "Лично", relative_to_absolute("0:11:22", "0:13:37", "1:11:30", "1:13:33", "1:44:34"))
  add_result(race, "Мужчины МТБ", "Сидоренко Александр", "Уссурийск", "Лично", relative_to_absolute("0:15:10", "0:16:58", "1:11:45", "1:13:25", "1:46:43"))
  add_result(race, "Мужчины МТБ", "Блиндяев Виктор", "Владивосток", "Лично", relative_to_absolute("0:15:57", "0:20:14", "1:13:30", "1:16:29", "1:46:48"))
  add_result(race, "Мужчины МТБ", "Москаленко Сергей", "Уссурийск", "Лично", relative_to_absolute("0:08:45", "0:11:35", "1:23:45", "1:26:05", "1:48:43"))

  add_result(race, "Мужчины МТБ", "Тарабрин Ярослав", "Уссурийск", "Лично", relative_to_absolute("0:11:20", "0:14:00", "1:19:17", "1:21:01", "1:49:19"))
  add_result(race, "Мужчины МТБ", "Кононов Владислав", "Уссурийск", "Лично", relative_to_absolute("0:11:08", "0:14:15", "1:23:20", "1:26:20", "1:57:38"))
  add_result(race, "Мужчины МТБ", "Крылов Алексей", "Владивосток", "Лично", relative_to_absolute("0:16:48", "0:19:30", nil, nil, nil))

  add_result(race, "Женщины МТБ", "Трощинская Яна", "Владивосток", "Лично", relative_to_absolute("0:11:05", "0:12:23", "1:08:45", "1:10:47", "1:35:01"))
  add_result(race, "Женщины МТБ", "Тиньгаева Инна", "Уссурийск", "Лично", relative_to_absolute("0:15:07", "0:17:10", "1:13:10", "1:14:52", "1:41:47"))
  add_result(race, "Женщины МТБ", "Ткаченко Светлана", "Уссурийск", "Лично", relative_to_absolute("0:16:10", "0:18:22", "1:18:30", "1:20:15", "1:48:20"))
  add_result(race, "Женщины МТБ", "Лукьянко Юлия", "Уссурийск", "Лично", relative_to_absolute("0:17:24", "0:19:42", "1:26:50", "1:28:55", "1:50:10"))
end
