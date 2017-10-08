h2 = race.title

ul.nav.nav-tabs
  - groups.each do |group|
    li
      a href="/races/#{race.id}?group_id=#{group.id}" = group.name

table.table.table-striped
  tr
    th #
    th = "Имя"
    th = "Команда"
    th = "Город"
    th = "Год"
    - race_disciplines.each do |race_discipline|
      th class="discipline-#{race_discipline.discipline!.name}"
        = race_discipline.discipline!.title
        br
        = race_discipline.distance_format
    th = "Итог"

  - results.to_a.each_with_index do |result, i|
    tr
      td rowspan="2" = i + 1
      td rowspan="2" = result.user!.name
      td rowspan="2" = result.team!.name
      td rowspan="2" = result.city!.name
      td rowspan="2" = result.user!.year
      - result.result_race_disciplines.each do |result_race_discipline|
        td class="discipline-#{result_race_discipline.race_discipline!.discipline!.name}" = result_race_discipline.time
      td rowspan="2" = Calculate.all_time result.result_race_disciplines

    tr
      - result.result_race_disciplines.each do |result_race_discipline|
        td class="discipline-#{result_race_discipline.race_discipline!.discipline!.name}" = result_race_discipline.speed

css:
  .wide {
    width: 95%;
  }
