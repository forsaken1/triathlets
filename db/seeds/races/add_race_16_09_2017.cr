def add_race_16_09_2017
  race = Race.create title: "Спринт-триатлон в Уссурийске на базе Южная", date: "16.09.2017"

  RaceDiscipline.create race_id: race.id, discipline_id: SWIM.id, position: 1, distance: 0.5.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: TRANSIT.id, position: 2, distance: 0.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: BICYCLE.id, position: 3, distance: 20.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: TRANSIT.id, position: 4, distance: 0.0.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: RUN.id, position: 5, distance: 5.0.to_f32

  import = Import.new

  import.add_result(race, "Мужчины МТБ", "Коноплин Александр", "Артем", "Лично", import.relative_to_absolute("0:10:08", "0:11:21", "0:53:15", "0:54:55", "1:14:32"))
  import.add_result(race, "Мужчины МТБ", "Котельвин Максим", "Уссурийск", "Лично", import.relative_to_absolute("0:08:17", "0:09:50", "0:53:18", "0:55:02", "1:15:02"))
  import.add_result(race, "Мужчины МТБ", "Коноплин Никита", "Артем", "Лично", import.relative_to_absolute("0:08:09", "0:09:16", "0:57:10", "0:58:29", "1:18:35"))
  import.add_result(race, "Мужчины МТБ", "Петров Артем", "Уссурийск", "Лично", import.relative_to_absolute("0:09:54", "0:11:37", "0:59:23", "1:01:50", "1:23:18"))
  import.add_result(race, "Мужчины МТБ", "Мазняк Антон", "Арсеньев", "Лично", import.relative_to_absolute("0:11:38", "0:13:43", "0:59:22", "1:01:55", "1:23:22"))

  import.add_result(race, "Мужчины МТБ", "Решетняк Максим", "Уссурийск", "Лично", import.relative_to_absolute("0:08:33", "0:11:16", "0:59:22", "1:02:49", "1:26:13"))
  import.add_result(race, "Мужчины МТБ", "Чубукин Сергей", "Арсеньев", "Лично", import.relative_to_absolute("0:09:59", "0:13:06", "1:02:56", "1:05:26", "1:26:50"))
  import.add_result(race, "Мужчины МТБ", "Овчинников Никита", "Владивосток", "Лично", import.relative_to_absolute("0:08:41", "0:11:37", "1:04:38", "1:05:50", "1:27:31"))
  import.add_result(race, "Мужчины МТБ", "Телин Евгений", "Находка", "Лично", import.relative_to_absolute("0:10:33", "0:12:50", "1:05:24", "1:07:49", "1:29:11"))
  import.add_result(race, "Мужчины МТБ", "Денейкин Сергей", "Партизанск", "Лично", import.relative_to_absolute("0:12:15", "0:14:57", "1:04:44", "1:06:05", "1:31:40"))

  import.add_result(race, "Мужчины МТБ", "Багрянов Максим", "Владивосток", "Лично", import.relative_to_absolute("0:08:43", "0:10:37", "1:01:52", "1:03:15", "1:31:50"))
  import.add_result(race, "Мужчины МТБ", "Смычков Алексей", "Партизанск", "Лично", import.relative_to_absolute("0:10:19", "0:12:30", "1:08:31", "1:10:59", "1:33:45"))
  import.add_result(race, "Мужчины МТБ", "Епишко Алексей", "Партизанск", "Лично", import.relative_to_absolute("0:10:50", "0:13:47", "1:07:48", "1:10:40", "1:37:30"))
  import.add_result(race, "Мужчины МТБ", "Падалко Максим", "Владивосток", "Лично", import.relative_to_absolute("0:15:28", "0:17:30", "1:09:41", "1:12:12", "1:38:38"))
  import.add_result(race, "Мужчины МТБ", "Якухный Дмитрий", "Владивосток", "Лично", import.relative_to_absolute("0:09:26", "0:10:33", "1:18:23", "1:20:28", "1:40:19"))

  import.add_result(race, "Мужчины МТБ", "Зернин Анатолий", "Уссурийск", "Лично", import.relative_to_absolute("0:11:29", "0:14:33", "1:12:37", "1:15:20", "1:40:38"))
  import.add_result(race, "Мужчины МТБ", "Крылов Алексей", "Владивосток", "Лично", import.relative_to_absolute("0:11:49", "0:14:08", "1:09:32", "1:13:00", "1:43:50"))
  import.add_result(race, "Мужчины МТБ", "Дубов Виталий", "Владивосток", "Лично", import.relative_to_absolute("0:12:32", "0:15:55", "1:17:19", "1:20:35", "1:45:49"))
  import.add_result(race, "Мужчины МТБ", "Бабкин Вячеслав", "Партизанск", "Лично", import.relative_to_absolute("0:17:30", "0:20:31", "1:23:40", "1:25:02", "1:45:55"))
  import.add_result(race, "Мужчины МТБ", "Калошин Вячеслав", "Владивосток", "Лично", import.relative_to_absolute("0:11:26", "0:16:05", "1:20:32", "1:23:35", "1:50:22"))

  import.add_result(race, "Мужчины МТБ", "Мазей Владимир", "Уссурийск", "Лично", import.relative_to_absolute("0:09:45", "0:12:17", "1:20:08", "1:23:34", "2:01:34"))
  import.add_result(race, "Мужчины МТБ", "Житковский Павел", "Арсеньев", "Лично", import.relative_to_absolute("0:11:10", "0:14:38", nil, nil, nil))

  import.reinit

  import.add_result(race, "Женщины МТБ", "Ткаченко Светлана", "Уссурийск", "Лично", import.relative_to_absolute("0:13:43", "0:16:26", "1:19:51", "1:22:20", "1:49:00"))
  import.add_result(race, "Женщины МТБ", "Дубова Юлия", "Владивосток", "Лично", import.relative_to_absolute("0:11:32", "0:13:56", "1:19:21", "1:21:40", "1:53:10"))

  # add_result(race, "", "", "", "",  "0:00:00", "0:00:00", "0:00:00", "0:00:00", "0:00:00", "0:00:00")
end
