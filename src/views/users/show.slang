h1 = user_presenter.name

.user-info
  .line
    = "Год рождения: #{user_presenter.year}"
  .line  
    = "Квалификация: #{user_presenter.qualification}"

h3 = "Гонки"

table.table.table-striped
  tr
    th #
    th = "Название"
    th = "Дата"
    th = "Место (пол и группа)"
    th = "Результат"

  - races_presenter.each_with_index do |race, i|
    tr
      td = i + 1
      td
        a href=race_path(race) = race.title
      td = race.date
      td = race.position
      td = race.time
