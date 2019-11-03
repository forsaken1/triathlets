h1 = team.name

table.table.table-striped
  tr
    th #
    th = "Имя"
    th = "Год"
    th = "Квалификация"

  - users_presenter.each_with_index do |user, i|
    tr
      td = i + 1
      td
        a href=user_path(user) = user.name
      td = user.year
      td = user.qualification
