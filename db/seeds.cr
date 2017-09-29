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
# add Group

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
  # "" => User.create(name: "", year: 19).id,
}

def add_result(race, user_name, city_name, team_name, *results)
  result = Result.create user_id: USERS[user_name], race_id: race.id, city_id: CITIES[city_name], team_id: TEAMS[team_name]

  results.each_with_index do |res, i|
    ResultRaceDiscipline.create(result_id: result.id, race_discipline_id: race.race_disciplines[i].id, position: i, time: res)
  end
end

# Спринт-триатлон 29.07.2017

race1 = Race.create title: "Спринт-триатлон"

discipline1 = Discipline.create name: "swim", title: "Плавание"
discipline2 = Discipline.create name: "bicycle", title: "Велосипед"
discipline3 = Discipline.create name: "run", title: "Бег"
discipline4 = Discipline.create name: "transit", title: "Транзитка"

RaceDiscipline.create race_id: race1.id, discipline_id: discipline1.id, position: 1, distance: 0.75.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 2, distance: 0.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline2.id, position: 3, distance: 20.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 4, distance: 0.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline3.id, position: 5, distance: 5.0.to_f32

add_result(race1, "Алексей Чахлов",       "Владивосток",  "Грибановка", "0:16:50", "0:01:01", "0:33:19", "0:00:33", "0:20:55")
add_result(race1, "Коноплин Никита",      "Артем",        "Лично",  "0:15:40", "0:01:14", "0:39:18", "0:00:47", "0:23:46")
add_result(race1, "Динмухаметов Даниил",  "Вилючинск",    "Лично",  "0:14:20", "0:01:21", "0:44:30", "0:00:55", "0:21:39")
add_result(race1, "Анисимов Иван",        "Владивосток",  "Лично",  "0:19:50", "0:01:13", "0:36:12", "0:01:24", "0:25:53")
add_result(race1, "Пиндюрин Алексей",     "Владивосток",  "Makkolli Racing Team", "0:19:40", "0:00:48", "0:36:52", "0:06:40", "0:20:50")
add_result(race1, "Мазняк Антон",         "Арсеньев",     "Лично",  "0:20:20", "0:02:16", "0:37:36", "0:01:08", "0:24:21")
add_result(race1, "Кашапов Марат",        "Находка",      "Лично",  "0:18:40", "0:01:34", "0:42:19", "0:00:36", "0:23:27")
add_result(race1, "Колесников Виктор",    "Владивосток",  "Лично",  "0:20:15", "0:01:21", "0:37:33", "0:01:50", "0:25:49")
add_result(race1, "Заборьев Влад",        "Владивосток",  "Разбег", "0:17:10", "0:01:31", "0:38:35", "0:01:22", "0:29:46")
add_result(race1, "Дубов Виталий",        "Владивосток",  "Makkolli Racing Team", "0:21:50", "0:01:39", "0:38:46", "0:00:58", "0:25:24")
add_result(race1, "Ясинков Денис",        "Владивосток",  "Makkolli Racing Team", "0:23:35", "0:01:41", "0:36:19", "0:00:54", "0:27:17")
add_result(race1, "Чубукин Сергей",       "Арсеньев",     "Лично",  "0:17:28", "0:02:46", "0:44:45", "0:01:00", "0:25:04")
add_result(race1, "Токуренов Николай",    "Улан-Удэ",     "Лично",  "0:16:40", "0:03:31", "0:43:53", "0:01:00", "0:28:42")
add_result(race1, "Вечерковский Александр", "Владивосток", "Гонка Героев", "0:17:55", "0:01:51", "0:52:30", "0:01:43", "0:19:53")
add_result(race1, "Денейкин Сергей",      "Партизанск",   "Лично",  "0:17:45", "0:03:07", "0:42:41", "0:01:44", "0:28:45")
add_result(race1, "Смычков Алексей",      "Уссурийск",    "Лично",  "0:18:22", "0:02:59", "0:47:20", "0:00:30", "0:25:05")
add_result(race1, "Крылов Алексей",       "Владивосток",  "XC TRAINING", "0:20:00", "0:02:05", "0:42:57", "0:01:36", "0:28:40")
add_result(race1, "Пузырев Андрей",       "Владивосток",  "Лично",  "0:12:10", "0:01:45", "0:45:56", "0:00:44", "0:35:22")
add_result(race1, "Гончаров Владимир",    "Находка",      "Лично",  "0:24:55", "0:02:50", "0:31:13", "0:00:00", "0:37:19")
add_result(race1, "Захаренко Алексей",    "Находка",      "Лично",  "0:20:00", "0:01:43", "0:43:00", "0:00:34", "0:32:36")
add_result(race1, "Епишко Алексей",       "Партизанск",   "Лично",  "0:19:30", "0:02:28", "0:45:42", "0:01:19", "0:29:54")
add_result(race1, "Филитович Дмитрий",    "-",            "Лично",  "0:19:07", "0:01:14", "0:53:25", "0:00:51", "0:25:37")
add_result(race1, "Луценко Станислав",    "Владивосток",  "Makkolli Racing Team", "0:23:25", "0:01:39", "0:47:49", "0:01:06", "0:28:40")
add_result(race1, "Чернышев Евгений",     "Находка",      "Лично",  "0:22:08", "0:00:00", "0:46:16", "0:00:00", "0:35:55")
add_result(race1, "Ващенко Игорь",        "Биробиджан",   "Йожики", "0:19:30", "0:02:08", "1:01:04", "0:00:39", "0:26:54")
add_result(race1, "Жарский Андрей",       "Владивосток",  "Лично",  "0:29:04", "0:00:00", "1:08:11", "0:00:00", "0:00:00")
add_result(race1, "Терсков Сергей",       "Хабаровск",    "Лично",  "0:00:00", "0:00:00", "0:00:00", "0:00:00", "0:00:00")

# add_result(race1, "", "", "", "0:", "0:", "0:", "0:", "0:")
