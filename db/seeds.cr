require "jennifer/adapter/postgres"
require "jennifer"
require "../config/jennifer"
require "../src/models/*"

# Delete all info

ResultRaceDiscipline.all.delete
RaceDiscipline.all.delete
Discipline.all.delete
Result.all.delete
User.all.delete
Race.all.delete
Team.all.delete
City.all.delete
Group.all.delete

# Groups

GROUPS = {
  "Мужчины МТБ" => Group.create(name: "Мужчины МТБ").id,
  "Мужчины Шоссе" => Group.create(name: "Мужчины Шоссе").id,
  "Женщины МТБ" => Group.create(name: "Женщины МТБ").id,
  "Женщины Шоссе" => Group.create(name: "Женщины Шоссе").id,
}

# Cities

CITIES = {
  "Владивосток" => City.create(name: "Владивосток").id,
  "Артем" => City.create(name: "Артем").id,
  "Уссурийск" => City.create(name: "Уссурийск").id,
  "Находка" => City.create(name: "Находка").id,
  "Арсеньев" => City.create(name: "Арсеньев").id,
  "Партизанск" => City.create(name: "Партизанск").id,
  "Хабаровск" => City.create(name: "Хабаровск").id,
  "Биробиджан" => City.create(name: "Биробиджан").id,
  "Вилючинск" => City.create(name: "Вилючинск").id,
  "Улан-Удэ" => City.create(name: "Улан-Удэ").id,
  "-" => City.create(name: "-").id
}

# Teams

TEAMS = {
  "Лично" => Team.create(name: "Лично").id,
  "Грибановка" => Team.create(name: "Грибановка").id,
  "Makkolli Racing Team" => Team.create(name: "Makkolli Racing Team").id,
  "Гонка Героев" => Team.create(name: "Гонка Героев").id,
  "Йожики" => Team.create(name: "Йожики").id,
  "Разбег" => Team.create(name: "Разбег").id,
  "XC TRAINING" => Team.create(name: "XC TRAINING").id
}

# Users

USERS = {
  "Алексей Чахлов" => User.create(name: "Алексей Чахлов", year: 1983).id,
  "Коноплин Никита" => User.create(name: "Коноплин Никита", year: 1993).id,
  "Динмухаметов Даниил" => User.create(name: "Динмухаметов Даниил", year: 1992).id,
  "Анисимов Иван" => User.create(name: "Анисимов Иван", year: 1979).id,
  "Пиндюрин Алексей" => User.create(name: "Пиндюрин Алексей", year: 1980).id,
  "Мазняк Антон" => User.create(name: "Мазняк Антон", year: 1986).id,
  "Кашапов Марат" => User.create(name: "Кашапов Марат", year: 1986).id,
  "Колесников Виктор" => User.create(name: "Колесников Виктор", year: 1969).id,
  "Заборьев Влад" => User.create(name: "Заборьев Влад", year: 2003).id,
  "Дубов Виталий" => User.create(name: "Дубов Виталий", year: 1981).id,
  "Ясинков Денис" => User.create(name: "Ясинков Денис", year: 1980).id,
  "Чубукин Сергей" => User.create(name: "Чубукин Сергей", year: 1988).id,
  "Токуренов Николай" => User.create(name: "Токуренов Николай", year: 1980).id,
  "Вечерковский Александр" => User.create(name: "Вечерковский Александр", year: 1983).id,
  "Денейкин Сергей" => User.create(name: "Денейкин Сергей", year: 1975).id,
  "Смычков Алексей" => User.create(name: "Смычков Алексей", year: 1987).id,
  "Крылов Алексей" => User.create(name: "Крылов Алексей", year: 1993).id,
  "Пузырев Андрей" => User.create(name: "Пузырев Андрей", year: 1995).id,
  "Гончаров Владимир" => User.create(name: "Гончаров Владимир", year: 1969).id,
  "Захаренко Алексей" => User.create(name: "Захаренко Алексей", year: 1986).id,
  "Епишко Алексей" => User.create(name: "Епишко Алексей", year: 1961).id,
  "Филитович Дмитрий" => User.create(name: "Филитович Дмитрий", year: 0).id,
  "Луценко Станислав" => User.create(name: "Луценко Станислав", year: 1984).id,
  "Чернышев Евгений" => User.create(name: "Чернышев Евгений", year: 1964).id,
  "Ващенко Игорь" => User.create(name: "Ващенко Игорь", year: 1969).id,
  "Жарский Андрей" => User.create(name: "Жарский Андрей", year: 1982).id,
  "Терсков Сергей" => User.create(name: "Терсков Сергей", year: 1983).id,
  "Коноплин Александр" => User.create(name: "Коноплин Александр", year: 1988).id,
  "Фролов Денис" => User.create(name: "Фролов Денис", year: 1978).id,
  "Дубовский Игорь" => User.create(name: "Дубовский Игорь", year: 1970).id,
  "Галаган Александр" => User.create(name: "Галаган Александр", year: 1979).id,
  "Помазенков Дмитрий" => User.create(name: "Помазенков Дмитрий", year: 1983).id,
  "Сакнаев Евгений" => User.create(name: "Сакнаев Евгений", year: 1984).id,
  "Послушаев Александр" => User.create(name: "Послушаев Александр", year: 1984).id,
  "Галендухин Сергей" => User.create(name: "Галендухин Сергей", year: 1972).id,
  "Зиганшина Кристина" => User.create(name: "Зиганшина Кристина", year: 1998).id,
  "Дубова Юлия" => User.create(name: "Дубова Юлия", year: 1982).id,
  "Трощинская Яна" => User.create(name: "Трощинская Яна", year: 1968).id,
  # "" => User.create(name: "", year: 19).id,
}

discipline1 = Discipline.create name: "swim", title: "Плавание"
discipline2 = Discipline.create name: "bicycle", title: "Велосипед"
discipline3 = Discipline.create name: "run", title: "Бег"
discipline4 = Discipline.create name: "transit", title: "Транзитка"

def add_result(race, group_name, user_name, city_name, team_name, all_result, *results)
  result_attrs = { user_id: USERS[user_name], race_id: race.id, city_id: CITIES[city_name], team_id: TEAMS[team_name], time: all_result }.to_h
  result_attrs.merge!({ group_id: GROUPS[group_name] }.to_h) if group_name
  result = Result.create result_attrs

  results.each_with_index do |res, i|
    ResultRaceDiscipline.create(result_id: result.id, race_discipline_id: race.race_disciplines[i].id, position: i, time: res)
  end
end

# Спринт-триатлон 29.07.2017

race1 = Race.create title: "Спринт-триатлон на о.Русском", date: "29.07.2017"

RaceDiscipline.create race_id: race1.id, discipline_id: discipline1.id, position: 1, distance: 0.75.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 2, distance: 0.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline2.id, position: 3, distance: 20.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 4, distance: 0.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline3.id, position: 5, distance: 5.0.to_f32

add_result(race1, "Мужчины Шоссе", "Алексей Чахлов",       "Владивосток",  "Грибановка", "1:12:40", "0:16:50", "0:01:01", "0:33:19", "0:00:33", "0:20:55")
add_result(race1, "Мужчины Шоссе", "Коноплин Никита",      "Артем",        "Лично", "1:20:47",  "0:15:40", "0:01:14", "0:39:18", "0:00:47", "0:23:46")
add_result(race1, "Мужчины Шоссе", "Динмухаметов Даниил",  "Вилючинск",    "Лично", "1:22:46",  "0:14:20", "0:01:21", "0:44:30", "0:00:55", "0:21:39")
add_result(race1, "Мужчины Шоссе", "Анисимов Иван",        "Владивосток",  "Лично", "1:24:33",  "0:19:50", "0:01:13", "0:36:12", "0:01:24", "0:25:53")
add_result(race1, "Мужчины Шоссе", "Пиндюрин Алексей",     "Владивосток",  "Makkolli Racing Team", "1:24:51", "0:19:40", "0:00:48", "0:36:52", "0:06:40", "0:20:50")
add_result(race1, "Мужчины Шоссе", "Мазняк Антон",         "Арсеньев",     "Лично", "1:25:42",  "0:20:20", "0:02:16", "0:37:36", "0:01:08", "0:24:21")
add_result(race1, "Мужчины Шоссе", "Кашапов Марат",        "Находка",      "Лично", "1:26:37",  "0:18:40", "0:01:34", "0:42:19", "0:00:36", "0:23:27")
add_result(race1, "Мужчины Шоссе", "Колесников Виктор",    "Владивосток",  "Лично", "1:26:50",  "0:20:15", "0:01:21", "0:37:33", "0:01:50", "0:25:49")
add_result(race1, "Мужчины Шоссе", "Заборьев Влад",        "Владивосток",  "Разбег", "1:28:27", "0:17:10", "0:01:31", "0:38:35", "0:01:22", "0:29:46")
add_result(race1, "Мужчины Шоссе", "Дубов Виталий",        "Владивосток",  "Makkolli Racing Team", "1:28:41", "0:21:50", "0:01:39", "0:38:46", "0:00:58", "0:25:24")
add_result(race1, "Мужчины Шоссе", "Ясинков Денис",        "Владивосток",  "Makkolli Racing Team", "1:29:48", "0:23:35", "0:01:41", "0:36:19", "0:00:54", "0:27:17")
add_result(race1, "Мужчины Шоссе", "Чубукин Сергей",       "Арсеньев",     "Лично", "1:31:05",  "0:17:28", "0:02:46", "0:44:45", "0:01:00", "0:25:04")
add_result(race1, "Мужчины Шоссе", "Токуренов Николай",    "Улан-Удэ",     "Лично", "1:33:18",  "0:16:40", "0:03:31", "0:43:53", "0:01:00", "0:28:42")
add_result(race1, "Мужчины Шоссе", "Вечерковский Александр", "Владивосток", "Гонка Героев", "1:33:54", "0:17:55", "0:01:51", "0:52:30", "0:01:43", "0:19:53")
add_result(race1, "Мужчины Шоссе", "Денейкин Сергей",      "Партизанск",   "Лично", "1:34:04",  "0:17:45", "0:03:07", "0:42:41", "0:01:44", "0:28:45")
add_result(race1, "Мужчины Шоссе", "Смычков Алексей",      "Уссурийск",    "Лично", "1:34:18",  "0:18:22", "0:02:59", "0:47:20", "0:00:30", "0:25:05")
add_result(race1, "Мужчины Шоссе", "Крылов Алексей",       "Владивосток",  "XC TRAINING", "1:35:19", "0:20:00", "0:02:05", "0:42:57", "0:01:36", "0:28:40")
add_result(race1, "Мужчины Шоссе", "Пузырев Андрей",       "Владивосток",  "Лично", "1:35:58",  "0:12:10", "0:01:45", "0:45:56", "0:00:44", "0:35:22")
add_result(race1, "Мужчины Шоссе", "Гончаров Владимир",    "Находка",      "Лично", "1:36:19",  "0:24:55", "0:02:50", "0:31:13", "0:00:00", "0:37:19")
add_result(race1, "Мужчины Шоссе", "Захаренко Алексей",    "Находка",      "Лично", "1:37:45",  "0:20:00", "0:01:43", "0:43:00", "0:00:34", "0:32:36")
add_result(race1, "Мужчины Шоссе", "Епишко Алексей",       "Партизанск",   "Лично", "1:38:55",  "0:19:30", "0:02:28", "0:45:42", "0:01:19", "0:29:54")
add_result(race1, "Мужчины Шоссе", "Филитович Дмитрий",    "-",            "Лично", "1:40:15",  "0:19:07", "0:01:14", "0:53:25", "0:00:51", "0:25:37")
add_result(race1, "Мужчины Шоссе", "Луценко Станислав",    "Владивосток",  "Makkolli Racing Team", "1:42:41", "0:23:25", "0:01:39", "0:47:49", "0:01:06", "0:28:40")
add_result(race1, "Мужчины Шоссе", "Чернышев Евгений",     "Находка",      "Лично", "1:44:20",  "0:22:08", nil,       "0:46:16", nil,       "0:35:55")
add_result(race1, "Мужчины Шоссе", "Ващенко Игорь",        "Биробиджан",   "Йожики", "1:50:16", "0:19:30", "0:02:08", "1:01:04", "0:00:39", "0:26:54")
add_result(race1, "Мужчины Шоссе", "Жарский Андрей",       "Владивосток",  "Лично",  nil,       "0:29:04", nil,       "1:08:11", nil,       nil)
add_result(race1, "Мужчины Шоссе", "Терсков Сергей",       "Хабаровск",    "Лично",  nil,       nil,       nil,       nil,       nil,       nil)

add_result(race1, "Женщины Шоссе", "Зиганшина Кристина",   "Владивосток", "Лично", "1:26:03",   "0:21:25", "0:01:29", "0:36:02", "0:00:56", "0:26:11")
add_result(race1, "Женщины Шоссе", "Дубова Юлия",          "Владивосток", "Makkolli Racing Team", "1:44:18", "0:21:55", "0:01:03", "0:44:39", "0:01:03", "0:35:38")
add_result(race1, "Женщины Шоссе", "Трощинская Яна",       "Владивосток", "Лично", "1:52:27",   "0:17:30", "0:01:27", "1:00:21", "0:00:38", "0:32:31")

# Спринт-триатлон 17.09.2016

race2 = Race.create title: "Спринт-триатлон в Уссурийске на базе Южная", date: "17.09.2016"

RaceDiscipline.create race_id: race2.id, discipline_id: discipline1.id, position: 1, distance: 0.5.to_f32
RaceDiscipline.create race_id: race2.id, discipline_id: discipline4.id, position: 2, distance: 0.0.to_f32
RaceDiscipline.create race_id: race2.id, discipline_id: discipline2.id, position: 3, distance: 20.0.to_f32
RaceDiscipline.create race_id: race2.id, discipline_id: discipline4.id, position: 4, distance: 0.0.to_f32
RaceDiscipline.create race_id: race2.id, discipline_id: discipline3.id, position: 5, distance: 5.0.to_f32

add_result(race2, nil, "Коноплин Александр",   "Артем",       "Лично", "1:21:10", "0:12:50", "0:02:10", "0:42:23", "0:02:17", "0:21:30")
add_result(race2, nil, "Фролов Денис",         "Уссурийск",   "Лично", "1:30:55", "0:16:30", "0:03:49", "0:43:31", "0:02:36", "0:24:29")
add_result(race2, nil, "Дубовский Игорь",      "Владивосток", "Лично", "1:33:09", "0:12:49", "0:04:22", "0:47:59", "0:03:00", "0:24:59")
add_result(race2, nil, "Галаган Александр",    "Владивосток", "Лично", "1:35:59", "0:13:07", "0:03:31", "0:48:32", "0:02:55", "0:27:54")
add_result(race2, nil, "Помазенков Дмитрий",   "Владивосток", "Лично", "1:36:18", "0:14:10", "0:03:20", "0:52:52", "0:02:17", "0:23:39")
add_result(race2, nil, "Сакнаев Евгений",      "Владивосток", "Лично", "1:40:39", "0:14:35", "0:02:47", "0:52:47", "0:02:36", "0:27:54")
add_result(race2, nil, "Послушаев Александр",  "Владивосток", "Лично", "1:45:41", "0:11:50", "0:04:12", "1:02:28", "0:02:16", "0:24:55")
add_result(race2, nil, "Крылов Алексей",       "Владивосток", "XC TRAINING", "1:47:57", "0:21:10", "0:04:51", "0:50:49", "0:02:40", "0:28:27")
add_result(race2, nil, "Галендухин Сергей",    "Владивосток", "Лично", "1:55:12", "0:18:40", "0:04:02", "0:57:38", "0:03:51", "0:31:01")

# add_result(race, "", "", "", "",  "0:00:00", "0:00:00", "0:00:00", "0:00:00", "0:00:00")
