h1 = "Спортсмены"

form.search-form.form-inline action=users_path method="GET"
  input.form-control placeholder="Введите имя" value=name name="name"
  button.btn.btn-primary = "Поиск"

table.table.table-striped
  tr
    th #
    th = "Имя"
    th = "Год"
    th = "Квалификация"
    /th = "Кол-во соревнований"

  - users.each_with_index do |user, i|
    tr
      td = i + 1
      td
        a href=user_path(user) = user.name
      td = user.year
      td = user.qualification
      /td
