require "jennifer"
require "jennifer/adapter/postgres"
require "../config/initializers/jennifer"
require "../src/models/*"
require "./lib"

# Delete all info

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

# Groups

GROUPS = {
  "Мужчины МТБ"   => Group.create(name: "Мужчины МТБ").id,
  "Мужчины Шоссе" => Group.create(name: "Мужчины Шоссе").id,
  "Женщины МТБ"   => Group.create(name: "Женщины МТБ").id,
  "Женщины Шоссе" => Group.create(name: "Женщины Шоссе").id,
}

# Cities

CITIES = {
  "Владивосток"          => City.create(name: "Владивосток").id,
  "Артем"                => City.create(name: "Артем").id,
  "Уссурийск"            => City.create(name: "Уссурийск").id,
  "Находка"              => City.create(name: "Находка").id,
  "Арсеньев"             => City.create(name: "Арсеньев").id,
  "Партизанск"           => City.create(name: "Партизанск").id,
  "Хабаровск"            => City.create(name: "Хабаровск").id,
  "Биробиджан"           => City.create(name: "Биробиджан").id,
  "Вилючинск"            => City.create(name: "Вилючинск").id,
  "Улан-Удэ"             => City.create(name: "Улан-Удэ").id,
  "Комсомольск-на-Амуре" => City.create(name: "Комсомольск-на-Амуре").id,
  "Спасск-Дальний"       => City.create(name: "Спасск-Дальний").id,
  "-"                    => City.create(name: "-").id,
}

# Teams

TEAMS = {
  "Лично"                => Team.create(name: "Лично").id,
  "Грибановка"           => Team.create(name: "Грибановка").id,
  "Makkolli Racing Team" => Team.create(name: "Makkolli Racing Team").id,
  "Гонка Героев"         => Team.create(name: "Гонка Героев").id,
  "Йожики"               => Team.create(name: "Йожики").id,
  "Разбег"               => Team.create(name: "Разбег").id,
  "XC TRAINING"          => Team.create(name: "XC TRAINING").id,
  "Седанка фитнес клаб"  => Team.create(name: "Седанка фитнес клаб").id,
  "Фантастические Лоси"  => Team.create(name: "Фантастические Лоси").id,
  "ООО 'АО АРТ'"         => Team.create(name: "ООО 'АО АРТ'").id,
  "IRON TEAM"            => Team.create(name: "IRON TEAM").id,
  "greentour"            => Team.create(name: "greentour").id,
  "VIA-PORT"             => Team.create(name: "VIA-PORT").id,
}

# Users

USERS = {
  "Чахлов Алексей"         => User.create(name: "Чахлов Алексей", year: 1983).id,
  "Коноплин Никита"        => User.create(name: "Коноплин Никита", year: 1993).id,
  "Динмухаметов Даниил"    => User.create(name: "Динмухаметов Даниил", year: 1992, qualification: "III").id,
  "Анисимов Иван"          => User.create(name: "Анисимов Иван", year: 1979).id,
  "Пиндюрин Алексей"       => User.create(name: "Пиндюрин Алексей", year: 1980).id,
  "Мазняк Антон"           => User.create(name: "Мазняк Антон", year: 1986).id,
  "Кашапов Марат"          => User.create(name: "Кашапов Марат", year: 1986).id,
  "Колесников Виктор"      => User.create(name: "Колесников Виктор", year: 1969).id,
  "Заборьев Влад"          => User.create(name: "Заборьев Влад", year: 2003).id,
  "Дубов Виталий"          => User.create(name: "Дубов Виталий", year: 1981).id,
  "Ясинков Денис"          => User.create(name: "Ясинков Денис", year: 1980).id,
  "Чубукин Сергей"         => User.create(name: "Чубукин Сергей", year: 1988).id,
  "Токуренов Николай"      => User.create(name: "Токуренов Николай", year: 1980).id,
  "Вечерковский Александр" => User.create(name: "Вечерковский Александр", year: 1983).id,
  "Денейкин Сергей"        => User.create(name: "Денейкин Сергей", year: 1975).id,
  "Смычков Алексей"        => User.create(name: "Смычков Алексей", year: 1987).id,
  "Крылов Алексей"         => User.create(name: "Крылов Алексей", year: 1993).id,
  "Пузырев Андрей"         => User.create(name: "Пузырев Андрей", year: 1995).id,
  "Гончаров Владимир"      => User.create(name: "Гончаров Владимир", year: 1969).id,
  "Захаренко Алексей"      => User.create(name: "Захаренко Алексей", year: 1986).id,
  "Епишко Алексей"         => User.create(name: "Епишко Алексей", year: 1961).id,
  "Филитович Дмитрий"      => User.create(name: "Филитович Дмитрий", year: 0).id,
  "Луценко Станислав"      => User.create(name: "Луценко Станислав", year: 1984).id,
  "Чернышев Евгений"       => User.create(name: "Чернышев Евгений", year: 1964).id,
  "Ващенко Игорь"          => User.create(name: "Ващенко Игорь", year: 1969, qualification: "IIIю").id,
  "Жарский Андрей"         => User.create(name: "Жарский Андрей", year: 1982).id,
  "Коноплин Александр"     => User.create(name: "Коноплин Александр", year: 1988).id,
  "Фролов Денис"           => User.create(name: "Фролов Денис", year: 1978).id,
  "Дубовский Игорь"        => User.create(name: "Дубовский Игорь", year: 1970).id,
  "Галаган Александр"      => User.create(name: "Галаган Александр", year: 1979).id,
  "Помазенков Дмитрий"     => User.create(name: "Помазенков Дмитрий", year: 1983).id,
  "Сакнаев Евгений"        => User.create(name: "Сакнаев Евгений", year: 1984).id,
  "Послушаев Александр"    => User.create(name: "Послушаев Александр", year: 1984).id,
  "Галендухин Сергей"      => User.create(name: "Галендухин Сергей", year: 1972).id,
  "Зиганшина Кристина"     => User.create(name: "Зиганшина Кристина", year: 1998).id,
  "Дубова Юлия"            => User.create(name: "Дубова Юлия", year: 1982).id,
  "Трощинская Яна"         => User.create(name: "Трощинская Яна", year: 1968).id,
  "Катренюк Наталья"       => User.create(name: "Катренюк Наталья", year: 1969).id,
  "Яковлева Елена"         => User.create(name: "Яковлева Елена", year: 1978).id,
  "Тищенко Илья"           => User.create(name: "Тищенко Илья", year: 1987).id,
  "Комаров Павел"          => User.create(name: "Комаров Павел", year: 1986, qualification: "МСМК").id,
  "Юрасов Вадим"           => User.create(name: "Юрасов Вадим", year: 1971).id,
  "Заборьев Константин"    => User.create(name: "Заборьев Константин", year: 1976).id,
  "Багрянов Максим"        => User.create(name: "Багрянов Максим", year: 1975).id,
  "Помазенков Дмитрий"     => User.create(name: "Помазенков Дмитрий", year: 1983).id,
  "Карпов Евгений"         => User.create(name: "Карпов Евгений", year: 1980).id,
  "Горох Сергей"           => User.create(name: "Горох Сергей", year: 1983).id,
  "Елисеев Павел"          => User.create(name: "Елисеев Павел", year: 1980).id,
  "Ураков Валерий"         => User.create(name: "Ураков Валерий", year: 1989).id,
  "Саутнер Олег"           => User.create(name: "Саутнер Олег", year: 1974).id,
  "Лизию Роман"            => User.create(name: "Лизию Роман", year: 1986).id,
  "Черкасов Игорь"         => User.create(name: "Черкасов Игорь", year: 1984).id,
  "Яловой Максим"          => User.create(name: "Яловой Максим", year: 1985).id,
  "Дъяченко Денис"         => User.create(name: "Дъяченко Денис", year: 1987).id,
  "Старов Евгений"         => User.create(name: "Старов Евгений", year: 1975).id,
  "Лагоша Александр"       => User.create(name: "Лагоша Александр", year: 1982).id,
  "Машин Игорь"            => User.create(name: "Машин Игорь", year: 1990).id,
  "Петров Александр"       => User.create(name: "Петров Александр", year: 1983).id,
  "Бабкин Вячеслав"        => User.create(name: "Бабкин Вячеслав", year: 1978).id,
  "Курепин Игорь"          => User.create(name: "Курепин Игорь", year: 1988).id,
  "Падалко Максим"         => User.create(name: "Падалко Максим", year: 1983).id,
  "Кладовщиков Евгений"    => User.create(name: "Кладовщиков Евгений", year: 1988).id,
  "Михайлов Антон"         => User.create(name: "Михайлов Антон", year: 1982).id,
  "Курдявцев Александр"    => User.create(name: "Курдявцев Александр", year: 1979).id,
  "Котельвин Максим"       => User.create(name: "Котельвин Максим", year: 1982).id,
  "Миклухин Андрей"        => User.create(name: "Миклухин Андрей", year: 1981).id,
  "Лепешкин Евгений"       => User.create(name: "Лепешкин Евгений", year: 1983).id,
  "Ильиных Александр"      => User.create(name: "Ильиных Александр", year: 1987).id,
  "Гагаркин Олег"          => User.create(name: "Гагаркин Олег", year: 1987).id,
  "Куксенок Денис"         => User.create(name: "Куксенок Денис", year: 1979).id,
  "Таюрская Юлия"          => User.create(name: "Таюрская Юлия", year: 1985).id,
  "Коноплин Юрий"          => User.create(name: "Коноплин Юрий", year: 1965).id,
  "Бобылев Михаил"         => User.create(name: "Бобылев Михаил", year: 0).id,
  "Гатауллин Андрей"       => User.create(name: "Гатауллин Андрей", year: 1970).id,
  "Маликов Алексей"        => User.create(name: "Маликов Алексей", year: 0).id,
  "Литвинов Алексей"       => User.create(name: "Литвинов Алексей", year: 0).id,
  "Алаев Роман"            => User.create(name: "Алаев Роман", year: 1979).id,
  "Маликов Николай"        => User.create(name: "Маликов Николай", year: 1985).id,
  "Кириллах Игорь"         => User.create(name: "Кириллах Игорь", year: 1989).id,
  "Якимов Кирилл"          => User.create(name: "Якимов Кирилл", year: 0).id,
  "Петров Артем"           => User.create(name: "Петров Артем", year: 1994).id,
  "Решетняк Максим"        => User.create(name: "Решетняк Максим", year: 1978).id,
  "Овчинников Никита"      => User.create(name: "Овчинников Никита", year: 1993).id,
  "Телин Евгений"          => User.create(name: "Телин Евгений", year: 1987).id,
  "Ткаченко Светлана"      => User.create(name: "Ткаченко Светлана", year: 1996).id,
  "Зернин Анатолий"        => User.create(name: "Зернин Анатолий", year: 1983).id,
  "Калошин Вячеслав"       => User.create(name: "Калошин Вячеслав", year: 1966).id,
  "Якухный Дмитрий"        => User.create(name: "Якухный Дмитрий", year: 1972).id,
  "Мазей Владимир"         => User.create(name: "Мазей Владимир", year: 1992).id,
  "Житковский Павел"       => User.create(name: "Житковский Павел", year: 1972).id,
  # "" => User.create(name: "", year: 19).id,
}

discipline1 = Discipline.create name: "swim", title: "Плавание"
discipline2 = Discipline.create name: "bicycle", title: "Велосипед"
discipline3 = Discipline.create name: "run", title: "Бег"
discipline4 = Discipline.create name: "transit", title: "Транзитка"
discipline5 = Discipline.create name: "bicycle-swim", title: "Вело + плавание"

# Спринт-триатлон 29.07.2017

race1 = Race.create title: "Спринт-триатлон на о.Русском", date: "29.07.2017"

RaceDiscipline.create race_id: race1.id, discipline_id: discipline1.id, position: 1, distance: 0.75.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 2, distance: 0.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline2.id, position: 3, distance: 20.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline4.id, position: 4, distance: 0.0.to_f32
RaceDiscipline.create race_id: race1.id, discipline_id: discipline3.id, position: 5, distance: 5.0.to_f32

add_result(race1, "Мужчины Шоссе", "Чахлов Алексей", "Владивосток", "Грибановка", "1:12:40", "0:16:50", "0:01:01", "0:33:19", "0:00:33", "0:20:55")
add_result(race1, "Мужчины Шоссе", "Коноплин Никита", "Артем", "Лично", "1:20:47", "0:15:40", "0:01:14", "0:39:18", "0:00:47", "0:23:46")
add_result(race1, "Мужчины Шоссе", "Динмухаметов Даниил", "Вилючинск", "Лично", "1:22:46", "0:14:20", "0:01:21", "0:44:30", "0:00:55", "0:21:39")
add_result(race1, "Мужчины Шоссе", "Анисимов Иван", "Владивосток", "Лично", "1:24:33", "0:19:50", "0:01:13", "0:36:12", "0:01:24", "0:25:53")
add_result(race1, "Мужчины Шоссе", "Пиндюрин Алексей", "Владивосток", "Makkolli Racing Team", "1:24:51", "0:19:40", "0:00:48", "0:36:52", "0:06:40", "0:20:50")
add_result(race1, "Мужчины Шоссе", "Мазняк Антон", "Арсеньев", "Лично", "1:25:42", "0:20:20", "0:02:16", "0:37:36", "0:01:08", "0:24:21")
add_result(race1, "Мужчины Шоссе", "Кашапов Марат", "Находка", "Лично", "1:26:37", "0:18:40", "0:01:34", "0:42:19", "0:00:36", "0:23:27")
add_result(race1, "Мужчины Шоссе", "Колесников Виктор", "Владивосток", "Лично", "1:26:50", "0:20:15", "0:01:21", "0:37:33", "0:01:50", "0:25:49")
add_result(race1, "Мужчины Шоссе", "Заборьев Влад", "Владивосток", "Разбег", "1:28:27", "0:17:10", "0:01:31", "0:38:35", "0:01:22", "0:29:46")
add_result(race1, "Мужчины Шоссе", "Дубов Виталий", "Владивосток", "Makkolli Racing Team", "1:28:41", "0:21:50", "0:01:39", "0:38:46", "0:00:58", "0:25:24")
add_result(race1, "Мужчины Шоссе", "Ясинков Денис", "Владивосток", "Makkolli Racing Team", "1:29:48", "0:23:35", "0:01:41", "0:36:19", "0:00:54", "0:27:17")
add_result(race1, "Мужчины Шоссе", "Чубукин Сергей", "Арсеньев", "Лично", "1:31:05", "0:17:28", "0:02:46", "0:44:45", "0:01:00", "0:25:04")
add_result(race1, "Мужчины Шоссе", "Токуренов Николай", "Улан-Удэ", "Лично", "1:33:18", "0:16:40", "0:03:31", "0:43:53", "0:01:00", "0:28:42")
add_result(race1, "Мужчины Шоссе", "Вечерковский Александр", "Владивосток", "Гонка Героев", "1:33:54", "0:17:55", "0:01:51", "0:52:30", "0:01:43", "0:19:53")
add_result(race1, "Мужчины Шоссе", "Денейкин Сергей", "Партизанск", "Лично", "1:34:04", "0:17:45", "0:03:07", "0:42:41", "0:01:44", "0:28:45")
add_result(race1, "Мужчины Шоссе", "Смычков Алексей", "Уссурийск", "Лично", "1:34:18", "0:18:22", "0:02:59", "0:47:20", "0:00:30", "0:25:05")
add_result(race1, "Мужчины Шоссе", "Крылов Алексей", "Владивосток", "XC TRAINING", "1:35:19", "0:20:00", "0:02:05", "0:42:57", "0:01:36", "0:28:40")
add_result(race1, "Мужчины Шоссе", "Пузырев Андрей", "Владивосток", "Лично", "1:35:58", "0:12:10", "0:01:45", "0:45:56", "0:00:44", "0:35:22")
add_result(race1, "Мужчины Шоссе", "Гончаров Владимир", "Находка", "Лично", "1:36:19", "0:24:55", "0:02:50", "0:31:13", nil, "0:37:19")
add_result(race1, "Мужчины Шоссе", "Захаренко Алексей", "Находка", "Лично", "1:37:45", "0:20:00", "0:01:43", "0:43:00", "0:00:34", "0:32:36")
add_result(race1, "Мужчины Шоссе", "Епишко Алексей", "Партизанск", "Лично", "1:38:55", "0:19:30", "0:02:28", "0:45:42", "0:01:19", "0:29:54")
add_result(race1, "Мужчины Шоссе", "Филитович Дмитрий", "-", "Лично", "1:40:15", "0:19:07", "0:01:14", "0:53:25", "0:00:51", "0:25:37")
add_result(race1, "Мужчины Шоссе", "Луценко Станислав", "Владивосток", "Makkolli Racing Team", "1:42:41", "0:23:25", "0:01:39", "0:47:49", "0:01:06", "0:28:40")
add_result(race1, "Мужчины Шоссе", "Чернышев Евгений", "Находка", "Лично", "1:44:20", "0:22:08", nil, "0:46:16", nil, "0:35:55")
add_result(race1, "Мужчины Шоссе", "Ващенко Игорь", "Биробиджан", "Йожики", "1:50:16", "0:19:30", "0:02:08", "1:01:04", "0:00:39", "0:26:54")
add_result(race1, "Мужчины Шоссе", "Жарский Андрей", "Владивосток", "Лично", nil, "0:29:04", nil, "1:08:11", nil, nil)

add_result(race1, "Женщины Шоссе", "Зиганшина Кристина", "Владивосток", "Лично", "1:26:03", "0:21:25", "0:01:29", "0:36:02", "0:00:56", "0:26:11")
add_result(race1, "Женщины Шоссе", "Дубова Юлия", "Владивосток", "Makkolli Racing Team", "1:44:18", "0:21:55", "0:01:03", "0:44:39", "0:01:03", "0:35:38")
add_result(race1, "Женщины Шоссе", "Трощинская Яна", "Владивосток", "Лично", "1:52:27", "0:17:30", "0:01:27", "1:00:21", "0:00:38", "0:32:31")

add_result(race1, "Женщины МТБ", "Катренюк Наталья", "Хабаровск", "Лично", "1:38:42", "0:21:20", nil, "0:49:13", "0:00:56", nil)
add_result(race1, "Женщины МТБ", "Яковлева Елена", "Владивосток", "Разбег", "1:41:04", "0:18:25", nil, "0:50:29", "0:01:15", nil)

add_result(race1, "Мужчины МТБ", "Тищенко Илья", "Владивосток", "Разбег", "1:17:57", "0:15:25", "0:01:10", "0:38:34", "0:01:15", "0:21:33")
add_result(race1, "Мужчины МТБ", "Комаров Павел", "Владивосток", "Лично", "1:19:37", "0:11:15", "0:01:44", "0:44:52", "0:01:09", "0:20:37")
add_result(race1, "Мужчины МТБ", "Юрасов Вадим", "Владивосток", "Лично", "1:21:01", "0:17:55", "0:02:49", "0:39:03", "0:00:16", "0:20:58")
add_result(race1, "Мужчины МТБ", "Заборьев Константин", "Владивосток", "Разбег", "1:23:16", "0:18:50", "0:01:44", "0:36:43", "0:01:24", "0:24:36")
add_result(race1, "Мужчины МТБ", "Багрянов Максим", "Владивосток", "Лично", "1:24:36", "0:15:30", "0:01:53", "0:42:32", "0:01:41", "0:23:01")
add_result(race1, "Мужчины МТБ", "Помазенков Дмитрий", "Владивосток", "Разбег", "1:24:54", "0:20:00", "0:02:52", "0:40:33", "0:02:07", "0:19:22")
add_result(race1, "Мужчины МТБ", "Карпов Евгений", "Владивосток", "Гонка Героев", "1:26:10", "0:18:00", "0:01:42", "0:43:12", "0:00:32", "0:22:44")
add_result(race1, "Мужчины МТБ", "Горох Сергей", "Владивосток", "IRON TEAM", "1:27:59", "0:19:40", "0:02:12", "0:42:30", "0:01:09", "0:22:27")
add_result(race1, "Мужчины МТБ", "Елисеев Павел", "Владивосток", "Гонка Героев", "1:29:16", "0:19:41", nil, "0:45:25", "0:01:11", "0:22:59")
add_result(race1, "Мужчины МТБ", "Ураков Валерий", "Владивосток", "Лично", "1:30:24", "0:17:50", "0:02:23", "0:46:36", "0:01:02", "0:22:33")
add_result(race1, "Мужчины МТБ", "Дубовский Игорь", "Владивосток", "Седанка фитнес клаб", "1:30:38", "0:21:30", "0:01:27", "0:43:11", "0:01:22", "0:23:08")
add_result(race1, "Мужчины МТБ", "Саутнер Олег", "Владивосток", "Лично", "1:31:19", "0:18:20", "0:01:49", "0:43:53", "0:01:17", "0:26:01")
add_result(race1, "Мужчины МТБ", "Лизию Роман", "Владивосток", "Лично", "1:32:25", "0:19:10", "0:01:34", "0:45:24", "0:04:24", "0:21:54")
add_result(race1, "Мужчины МТБ", "Черкасов Игорь", "Владивосток", "Лично", "1:35:42", "0:14:57", "0:02:57", "0:46:05", "0:01:43", "0:30:00")
add_result(race1, "Мужчины МТБ", "Яловой Максим", "Владивосток", "Гонка Героев", "1:38:14", "0:18:35", "0:02:20", "0:50:51", "0:00:33", "0:25:55")
add_result(race1, "Мужчины МТБ", "Дъяченко Денис", "Владивосток", "Фантастические Лоси", "1:38:47", "0:25:50", "0:02:02", "0:43:15", "0:01:12", "0:26:28")
add_result(race1, "Мужчины МТБ", "Старов Евгений", "Владивосток", "Лично", "1:38:50", "0:19:20", "0:02:12", "0:48:29", "0:00:56", "0:27:53")
add_result(race1, "Мужчины МТБ", "Лагоша Александр", "Владивосток", "Гонка Героев", "1:38:57", "0:22:15", "0:01:52", "0:49:49", "0:00:42", "0:24:19")
add_result(race1, "Мужчины МТБ", "Машин Игорь", "Владивосток", "Фантастические Лоси", "1:41:01", "0:21:20", "0:02:56", "0:43:18", "0:01:26", "0:32:01")
add_result(race1, "Мужчины МТБ", "Петров Александр", "Владивосток", "Лично", "1:46:24", "0:19:45", "0:02:33", "0:50:42", "0:01:38", "0:31:46")
add_result(race1, "Мужчины МТБ", "Бабкин Вячеслав", "Партизанск", "Лично", "1:46:27", "0:26:20", "0:02:06", "0:47:27", "0:01:20", "0:29:14")
add_result(race1, "Мужчины МТБ", "Курепин Игорь", "Владивосток", "Лично", "1:47:32", "0:25:35", "0:02:05", "0:50:10", "0:00:40", "0:29:02")
add_result(race1, "Мужчины МТБ", "Падалко Максим", "Владивосток", "Фантастические Лоси", "1:49:53", "0:29:30", "0:01:38", "0:44:44", "0:00:58", "0:33:03")
add_result(race1, "Мужчины МТБ", "Кладовщиков Евгений", "Владивосток", "Лично", "1:53:23", "0:24:10", "0:03:03", "0:56:58", "0:00:45", "0:28:28")
add_result(race1, "Мужчины МТБ", "Михайлов Антон", "Владивосток", "Лично", "1:53:24", "0:31:30", "0:00:13", "0:52:29", "0:00:48", "0:28:24")
add_result(race1, "Мужчины МТБ", "Курдявцев Александр", "Владивосток", "ООО 'АО АРТ'", "2:13:00", "0:38:45", "0:02:41", "0:57:53", "0:01:01", "0:32:49")

# Спринт-триатлон 17.09.2016

race2 = Race.create title: "Спринт-триатлон в Уссурийске на базе Южная", date: "17.09.2016"

RaceDiscipline.create race_id: race2.id, discipline_id: discipline1.id, position: 1, distance: 0.5.to_f32
RaceDiscipline.create race_id: race2.id, discipline_id: discipline4.id, position: 2, distance: 0.0.to_f32
RaceDiscipline.create race_id: race2.id, discipline_id: discipline2.id, position: 3, distance: 20.0.to_f32
RaceDiscipline.create race_id: race2.id, discipline_id: discipline4.id, position: 4, distance: 0.0.to_f32
RaceDiscipline.create race_id: race2.id, discipline_id: discipline3.id, position: 5, distance: 5.0.to_f32

add_result(race2, nil, "Коноплин Александр", "Артем", "Лично", "1:21:10", "0:12:50", "0:02:10", "0:42:23", "0:02:17", "0:21:30")
add_result(race2, nil, "Фролов Денис", "Уссурийск", "Лично", "1:30:55", "0:16:30", "0:03:49", "0:43:31", "0:02:36", "0:24:29")
add_result(race2, nil, "Дубовский Игорь", "Владивосток", "Лично", "1:33:09", "0:12:49", "0:04:22", "0:47:59", "0:03:00", "0:24:59")
add_result(race2, nil, "Галаган Александр", "Владивосток", "Лично", "1:35:59", "0:13:07", "0:03:31", "0:48:32", "0:02:55", "0:27:54")
add_result(race2, nil, "Помазенков Дмитрий", "Владивосток", "Лично", "1:36:18", "0:14:10", "0:03:20", "0:52:52", "0:02:17", "0:23:39")
add_result(race2, nil, "Сакнаев Евгений", "Владивосток", "Лично", "1:40:39", "0:14:35", "0:02:47", "0:52:47", "0:02:36", "0:27:54")
add_result(race2, nil, "Послушаев Александр", "Владивосток", "Лично", "1:45:41", "0:11:50", "0:04:12", "1:02:28", "0:02:16", "0:24:55")
add_result(race2, nil, "Крылов Алексей", "Владивосток", "XC TRAINING", "1:47:57", "0:21:10", "0:04:51", "0:50:49", "0:02:40", "0:28:27")
add_result(race2, nil, "Галендухин Сергей", "Владивосток", "Лично", "1:55:12", "0:18:40", "0:04:02", "0:57:38", "0:03:51", "0:31:01")

# X-Triathlon 19.08.2017

race3 = Race.create title: "X-триатлон на острове Русском", date: "19.08.2017"

RaceDiscipline.create race_id: race3.id, discipline_id: discipline5.id, position: 1, distance: 34.to_f32
RaceDiscipline.create race_id: race3.id, discipline_id: discipline3.id, position: 2, distance: 8.to_f32

add_result(race3, "Мужчины МТБ", "Чахлов Алексей", "Владивосток", "Грибановка", "2:37:55", "1:54:14", "0:43:41")
add_result(race3, "Мужчины МТБ", "Коноплин Александр", "Артем", "Лично", "2:45:59", "2:02:27", "0:43:32")
add_result(race3, "Мужчины МТБ", "Заборьев Константин", "Владивосток", "Разбег", "2:48:11", "2:03:00", "0:45:11")
add_result(race3, "Мужчины МТБ", "Котельвин Максим", "Уссурийск", "Лично", "2:49:55", "2:01:25", "0:48:30")
add_result(race3, "Мужчины МТБ", "Миклухин Андрей", "Владивосток", "greentour", "2:55:38", "2:06:51", "0:48:47")

add_result(race3, "Мужчины МТБ", "Лепешкин Евгений", "Владивосток", "Лично", "2:57:26", "2:14:32", "0:42:54")
add_result(race3, "Мужчины МТБ", "Тищенко Илья", "Владивосток", "Разбег", "2:57:33", "2:09:09", "0:48:24")
add_result(race3, "Мужчины МТБ", "Ильиных Александр", "Хабаровск", "Лично", "3:03:36", "2:10:59", "0:52:37")
add_result(race3, "Мужчины МТБ", "Гагаркин Олег", "Владивосток", "XC TRAINING", "3:07:45", "2:22:31", "0:45:14")
add_result(race3, "Мужчины МТБ", "Кашапов Марат", "Находка", "VIA-PORT", "3:16:02", "2:25:54", "0:50:08")

add_result(race3, "Мужчины МТБ", "Саутнер Олег", "Владивосток", "Лично", "3:16:11", "2:25:42", "0:50:29")
add_result(race3, "Мужчины МТБ", "Куксенок Денис", "Комсомольск-на-Амуре", "Лично", "3:17:48", "2:25:41", "0:52:07")
add_result(race3, "Мужчины МТБ", "Захаренко Алексей", "Находка", "VIA-PORT", "3:18:43", "2:23:00", "0:55:43")
add_result(race3, "Мужчины МТБ", "Дубовский Игорь", "Владивосток", "Лично", "3:28:50", "2:31:54", "0:56:56")
add_result(race3, "Мужчины МТБ", "Черкасов Игорь", "Владивосток", "Лично", "3:29:45", "2:27:03", "1:02:42")

add_result(race3, "Мужчины МТБ", "Денейкин Сергей", "Партизанск", "Лично", "3:33:13", "2:33:36", "0:59:37")
add_result(race3, "Мужчины МТБ", "Дубов Виталий", "Владивосток", "Makkolli Racing Team", "3:33:47", "2:41:24", "0:52:23")
add_result(race3, "Мужчины МТБ", "Коноплин Юрий", "Артем", "Лично", "3:34:55", "2:29:14", "1:05:41")
add_result(race3, "Мужчины МТБ", "Пиндюрин Алексей", "Владивосток", "Makkolli Racing Team", "3:38:45", "2:42:34", "0:56:12")
add_result(race3, "Мужчины МТБ", "Ясинков Денис", "Владивосток", "Makkolli Racing Team", "3:38:47", "2:45:56", "0:52:51")

add_result(race3, "Мужчины МТБ", "Бобылев Михаил", "Владивосток", "Лично", "3:41:44", "2:51:16", "0:50:28")
add_result(race3, "Мужчины МТБ", "Епишко Алексей", "Партизанск", "Лично", "3:49:36", "2:40:17", "1:09:18")
add_result(race3, "Мужчины МТБ", "Лизию Роман", "Владивосток", "Лично", "3:52:43", "2:51:40", "1:01:03")
add_result(race3, "Мужчины МТБ", "Крылов Алексей", "Владивосток", "XC TRAINING", "3:52:59", "2:46:21", "1:06:38")
add_result(race3, "Мужчины МТБ", "Гатауллин Андрей", "Спасск-Дальний", "Лично", "3:53:16", "2:46:28", "1:06:49")

add_result(race3, "Мужчины МТБ", "Маликов Алексей", "Владивосток", "Лично", "4:13:40", "3:14:42", "0:58:58")
add_result(race3, "Мужчины МТБ", "Петров Александр", "Владивосток", "Лично", "4:16:59", "3:03:42", "1:13:18")
add_result(race3, "Мужчины МТБ", "Дъяченко Денис", "Владивосток", "Фантастические Лоси", "4:17:27", "3:12:07", "1:05:20")
add_result(race3, "Мужчины МТБ", "Литвинов Алексей", "Владивосток", "Лично", "4:19:55", "3:19:33", "1:00:22")
add_result(race3, "Мужчины МТБ", "Алаев Роман", "Владивосток", "Лично", "4:28:54", "3:29:54", "0:59:00")

add_result(race3, "Мужчины МТБ", "Маликов Николай", "Владивосток", "Лично", "4:33:27", "3:40:40", "0:43:41")
add_result(race3, "Мужчины МТБ", "Кириллах Игорь", "Владивосток", "Лично", "5:33:39", "3:38:14", "0:43:41")
add_result(race3, "Мужчины МТБ", "Багрянов Максим", "Владивосток", "Лично", nil, "3:07:22", nil)
add_result(race3, "Мужчины МТБ", "Якимов Кирилл", "Владивосток", "Лично", nil, nil, nil)
add_result(race3, "Мужчины МТБ", "Падалко Максим", "Владивосток", "Фантастические Лоси", nil, nil, nil)

add_result(race3, "Женщины МТБ", "Трощинская Яна", "Владивосток", "IRON TEAM", "4:24:48", "3:21:12", "1:03:36")
add_result(race3, "Женщины МТБ", "Таюрская Юлия", "Владивосток", "IRON TEAM", "5:51:57", "4:21:20", "1:30:37")

# Rainbowman 2017

race4 = Race.create title: "Спринт-триатлон в Уссурийске на базе Южная", date: "16.09.2017"

RaceDiscipline.create race_id: race4.id, discipline_id: discipline1.id, position: 1, distance: 0.5.to_f32
RaceDiscipline.create race_id: race4.id, discipline_id: discipline4.id, position: 2, distance: 0.0.to_f32
RaceDiscipline.create race_id: race4.id, discipline_id: discipline2.id, position: 3, distance: 20.0.to_f32
RaceDiscipline.create race_id: race4.id, discipline_id: discipline4.id, position: 4, distance: 0.0.to_f32
RaceDiscipline.create race_id: race4.id, discipline_id: discipline3.id, position: 5, distance: 5.0.to_f32

add_result(race4, "Мужчины МТБ", "Коноплин Александр", "Артем", "Лично", relative_to_absolute("0:10:08", "0:11:21", "0:53:15", "0:54:55", "1:14:32"))
add_result(race4, "Мужчины МТБ", "Котельвин Максим", "Уссурийск", "Лично", relative_to_absolute("0:08:17", "0:09:50", "0:53:18", "0:55:02", "1:15:02"))
add_result(race4, "Мужчины МТБ", "Коноплин Никита", "Артем", "Лично", relative_to_absolute("0:08:09", "0:09:16", "0:57:10", "0:58:29", "1:18:35"))
add_result(race4, "Мужчины МТБ", "Петров Артем", "Уссурийск", "Лично", relative_to_absolute("0:09:54", "0:11:37", "0:59:23", "1:01:50", "1:23:18"))
add_result(race4, "Мужчины МТБ", "Мазняк Антон", "Арсеньев", "Лично", relative_to_absolute("0:11:38", "0:13:43", "0:59:22", "1:01:55", "1:23:22"))

add_result(race4, "Мужчины МТБ", "Решетняк Максим", "Уссурийск", "Лично", relative_to_absolute("0:08:33", "0:11:16", "0:59:22", "1:02:49", "1:26:13"))
add_result(race4, "Мужчины МТБ", "Чубукин Сергей", "Арсеньев", "Лично", relative_to_absolute("0:09:59", "0:13:06", "1:02:56", "1:05:26", "1:26:50"))
add_result(race4, "Мужчины МТБ", "Овчинников Никита", "Владивосток", "Лично", relative_to_absolute("0:08:41", "0:11:37", "1:04:38", "1:05:50", "1:27:31"))
add_result(race4, "Мужчины МТБ", "Телин Евгений", "Находка", "Лично", relative_to_absolute("0:10:33", "0:12:50", "1:05:24", "1:07:49", "1:29:11"))
add_result(race4, "Мужчины МТБ", "Денейкин Сергей", "Партизанск", "Лично", relative_to_absolute("0:12:15", "0:14:57", "1:04:44", "1:06:05", "1:31:40"))

add_result(race4, "Мужчины МТБ", "Багрянов Максим", "Владивосток", "Лично", relative_to_absolute("0:08:43", "0:10:37", "1:01:52", "1:03:15", "1:31:50"))
add_result(race4, "Мужчины МТБ", "Смычков Алексей", "Партизанск", "Лично", relative_to_absolute("0:10:19", "0:12:30", "1:08:31", "1:10:59", "1:33:45"))
add_result(race4, "Мужчины МТБ", "Епишко Алексей", "Партизанск", "Лично", relative_to_absolute("0:10:50", "0:13:47", "1:07:48", "1:10:40", "1:37:30"))
add_result(race4, "Мужчины МТБ", "Падалко Максим", "Владивосток", "Лично", relative_to_absolute("0:15:28", "0:17:30", "1:09:41", "1:12:12", "1:38:38"))
add_result(race4, "Мужчины МТБ", "Якухный Дмитрий", "Владивосток", "Лично", relative_to_absolute("0:09:26", "0:10:33", "1:18:23", "1:20:28", "1:40:19"))

add_result(race4, "Мужчины МТБ", "Зернин Анатолий", "Уссурийск", "Лично", relative_to_absolute("0:11:29", "0:14:33", "1:12:37", "1:15:20", "1:40:38"))
add_result(race4, "Мужчины МТБ", "Крылов Алексей", "Владивосток", "Лично", relative_to_absolute("0:11:49", "0:14:08", "1:09:32", "1:13:00", "1:43:50"))
add_result(race4, "Мужчины МТБ", "Дубов Виталий", "Владивосток", "Лично", relative_to_absolute("0:12:32", "0:15:55", "1:17:19", "1:20:35", "1:45:49"))
add_result(race4, "Мужчины МТБ", "Бабкин Вячеслав", "Партизанск", "Лично", relative_to_absolute("0:17:30", "0:20:31", "1:23:40", "1:25:02", "1:45:55"))
add_result(race4, "Мужчины МТБ", "Калошин Вячеслав", "Владивосток", "Лично", relative_to_absolute("0:11:26", "0:16:05", "1:20:32", "1:23:35", "1:50:22"))

add_result(race4, "Мужчины МТБ", "Мазей Владимир", "Уссурийск", "Лично", relative_to_absolute("0:09:45", "0:12:17", "1:20:08", "1:23:34", "2:01:34"))
add_result(race4, "Мужчины МТБ", "Житковский Павел", "Арсеньев", "Лично", relative_to_absolute("0:11:10", "0:14:38", nil, nil, nil))

add_result(race4, "Женщины МТБ", "Ткаченко Светлана", "Уссурийск", "Лично", relative_to_absolute("0:13:43", "0:16:26", "1:19:51", "1:22:20", "1:49:00"))
add_result(race4, "Женщины МТБ", "Дубова Юлия", "Владивосток", "Лично", relative_to_absolute("0:11:32", "0:13:56", "1:19:21", "1:21:40", "1:53:10"))

# add_result(race, "", "", "", "",  "0:00:00", "0:00:00", "0:00:00", "0:00:00", "0:00:00", "0:00:00")
