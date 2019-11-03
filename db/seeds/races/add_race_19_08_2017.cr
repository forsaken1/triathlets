def add_race_19_08_2017
  race = Race.create title: "X-триатлон на острове Русском", date: "19.08.2017"

  RaceDiscipline.create race_id: race.id, discipline_id: BICYCLE_SWIM.id, position: 1, distance: 34.to_f32
  RaceDiscipline.create race_id: race.id, discipline_id: RUN.id, position: 2, distance: 8.to_f32

  import = Import.new

  import.add_result(race, "Мужчины МТБ", "Чахлов Алексей", "Владивосток", "Грибановка", "2:37:55", "1:54:14", "0:43:41")
  import.add_result(race, "Мужчины МТБ", "Коноплин Александр", "Артем", "Лично", "2:45:59", "2:02:27", "0:43:32")
  import.add_result(race, "Мужчины МТБ", "Заборьев Константин", "Владивосток", "Разбег", "2:48:11", "2:03:00", "0:45:11")
  import.add_result(race, "Мужчины МТБ", "Котельвин Максим", "Уссурийск", "Лично", "2:49:55", "2:01:25", "0:48:30")
  import.add_result(race, "Мужчины МТБ", "Миклухин Андрей", "Владивосток", "greentour", "2:55:38", "2:06:51", "0:48:47")

  import.add_result(race, "Мужчины МТБ", "Лепешкин Евгений", "Владивосток", "Лично", "2:57:26", "2:14:32", "0:42:54")
  import.add_result(race, "Мужчины МТБ", "Тищенко Илья", "Владивосток", "Разбег", "2:57:33", "2:09:09", "0:48:24")
  import.add_result(race, "Мужчины МТБ", "Ильиных Александр", "Хабаровск", "Лично", "3:03:36", "2:10:59", "0:52:37")
  import.add_result(race, "Мужчины МТБ", "Гагаркин Олег", "Владивосток", "XC TRAINING", "3:07:45", "2:22:31", "0:45:14")
  import.add_result(race, "Мужчины МТБ", "Кашапов Марат", "Находка", "VIA-PORT", "3:16:02", "2:25:54", "0:50:08")

  import.add_result(race, "Мужчины МТБ", "Саутнер Олег", "Владивосток", "Лично", "3:16:11", "2:25:42", "0:50:29")
  import.add_result(race, "Мужчины МТБ", "Куксенок Денис", "Комсомольск-на-Амуре", "Лично", "3:17:48", "2:25:41", "0:52:07")
  import.add_result(race, "Мужчины МТБ", "Захаренко Алексей", "Находка", "VIA-PORT", "3:18:43", "2:23:00", "0:55:43")
  import.add_result(race, "Мужчины МТБ", "Дубовский Игорь", "Владивосток", "Лично", "3:28:50", "2:31:54", "0:56:56")
  import.add_result(race, "Мужчины МТБ", "Черкасов Игорь", "Владивосток", "Лично", "3:29:45", "2:27:03", "1:02:42")

  import.add_result(race, "Мужчины МТБ", "Денейкин Сергей", "Партизанск", "Лично", "3:33:13", "2:33:36", "0:59:37")
  import.add_result(race, "Мужчины МТБ", "Дубов Виталий", "Владивосток", "Makkolli Racing Team", "3:33:47", "2:41:24", "0:52:23")
  import.add_result(race, "Мужчины МТБ", "Коноплин Юрий", "Артем", "Лично", "3:34:55", "2:29:14", "1:05:41")
  import.add_result(race, "Мужчины МТБ", "Пиндюрин Алексей", "Владивосток", "Makkolli Racing Team", "3:38:45", "2:42:34", "0:56:12")
  import.add_result(race, "Мужчины МТБ", "Ясинков Денис", "Владивосток", "Makkolli Racing Team", "3:38:47", "2:45:56", "0:52:51")

  import.add_result(race, "Мужчины МТБ", "Бобылев Михаил", "Владивосток", "Лично", "3:41:44", "2:51:16", "0:50:28")
  import.add_result(race, "Мужчины МТБ", "Епишко Алексей", "Партизанск", "Лично", "3:49:36", "2:40:17", "1:09:18")
  import.add_result(race, "Мужчины МТБ", "Лизию Роман", "Владивосток", "Лично", "3:52:43", "2:51:40", "1:01:03")
  import.add_result(race, "Мужчины МТБ", "Крылов Алексей", "Владивосток", "XC TRAINING", "3:52:59", "2:46:21", "1:06:38")
  import.add_result(race, "Мужчины МТБ", "Гатауллин Андрей", "Спасск-Дальний", "Лично", "3:53:16", "2:46:28", "1:06:49")

  import.add_result(race, "Мужчины МТБ", "Маликов Алексей", "Владивосток", "Лично", "4:13:40", "3:14:42", "0:58:58")
  import.add_result(race, "Мужчины МТБ", "Петров Александр", "Владивосток", "Лично", "4:16:59", "3:03:42", "1:13:18")
  import.add_result(race, "Мужчины МТБ", "Дъяченко Денис", "Владивосток", "Фантастические Лоси", "4:17:27", "3:12:07", "1:05:20")
  import.add_result(race, "Мужчины МТБ", "Литвинов Алексей", "Владивосток", "Лично", "4:19:55", "3:19:33", "1:00:22")
  import.add_result(race, "Мужчины МТБ", "Алаев Роман", "Владивосток", "Лично", "4:28:54", "3:29:54", "0:59:00")

  import.add_result(race, "Мужчины МТБ", "Маликов Николай", "Владивосток", "Лично", "4:33:27", "3:40:40", "0:43:41")
  import.add_result(race, "Мужчины МТБ", "Кириллах Игорь", "Владивосток", "Лично", "5:33:39", "3:38:14", "0:43:41")
  import.add_result(race, "Мужчины МТБ", "Багрянов Максим", "Владивосток", "Лично", nil, "3:07:22", nil)
  import.add_result(race, "Мужчины МТБ", "Якимов Кирилл", "Владивосток", "Лично", nil, nil, nil)
  import.add_result(race, "Мужчины МТБ", "Падалко Максим", "Владивосток", "Фантастические Лоси", nil, nil, nil)

  import.reinit

  import.add_result(race, "Женщины МТБ", "Трощинская Яна", "Владивосток", "IRON TEAM", "4:24:48", "3:21:12", "1:03:36")
  import.add_result(race, "Женщины МТБ", "Таюрская Юлия", "Владивосток", "IRON TEAM", "5:51:57", "4:21:20", "1:30:37")
end
