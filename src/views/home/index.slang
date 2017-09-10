h2 = "Мультигонки"

div
  - races.each do |race|
    h3 = race.title
    a href="races/#{race.id}" = "Результаты"
