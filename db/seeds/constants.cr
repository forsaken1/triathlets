SWIM         = Discipline.create name: "swim", title: "Плавание"
BICYCLE      = Discipline.create name: "bicycle", title: "Велосипед"
RUN          = Discipline.create name: "run", title: "Бег"
TRANSIT      = Discipline.create name: "transit", title: "Транзитка"
BICYCLE_SWIM = Discipline.create name: "bicycle-swim", title: "Вело + плавание"

GROUPS = {
  "Мужчины МТБ"   => Group.create(name: "Мужчины МТБ").id,
  "Мужчины Шоссе" => Group.create(name: "Мужчины Шоссе").id,
  "Женщины МТБ"   => Group.create(name: "Женщины МТБ").id,
  "Женщины Шоссе" => Group.create(name: "Женщины Шоссе").id,
}

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