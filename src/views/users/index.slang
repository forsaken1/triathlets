h2 = "Спортсмены"

table.table.table-striped
  tr
    th #
    th = "Имя"
    th = "Квалификация"
    th = "Год"

  - users.each_with_index do |user, i|
    tr
      td = i + 1
      td
        a href=user_path(user) = user.name
      td = user.qualification
      td = user.year
