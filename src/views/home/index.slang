h2 = "Мультиспорт Приморского края"

div
  - races.each do |race|
    h3 = race.title
    a href="races/#{race.id}" = "Результаты"
