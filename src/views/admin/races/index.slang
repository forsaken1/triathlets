h1 = "Триатлоны"

table.table.table-striped
  tr
    th #
    th = "Название"
    th = "Дата"
    th = "Действия"

  - races.each_with_index do |race, i|
    tr
      td = i + 1
      td
        a href=admin_race_path(race) = race.title
      td = race.date
      td
        a href=admin_race_path(race) = "Просмотр"