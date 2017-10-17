h2 = user.name

h4 = "Гонки"

table.table.table-striped
  tr
    th #
    th = "Название"
    th = "Дата"

  - races.each_with_index do |race, i|
    tr
      td = i + 1
      td
        a href=race_path(race) = race.title
      td = race.date
