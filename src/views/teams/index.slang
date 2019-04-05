h1 = "Команды"

form.search-form.form-inline action=teams_path method="GET"
  input.form-control placeholder="Введите название" value=name name="name"
  button.btn.btn-primary = "Поиск"

table.table.table-striped
  tr
    th #
    th = "Название"
    th = "Кол-во участников"

  - teams.each_with_index do |team, i|
    tr
      td = i + 1
      td
        a href=team_path(team) = team.name
      td = team.count
