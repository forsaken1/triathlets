h2 = "Мультиспорт Приморского края"

.races
  - races.each do |race|
    .race
      h3 = race.title
      .date
        = "Дата: "
        = race.date
      a href="races/#{race.id}" = "Результаты"
