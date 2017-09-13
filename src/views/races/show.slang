h2 = race.title

table class="table table-striped"
  tr
    th #
    th = "Имя"
    th = "Команда"
    th = "Год"
    - race_disciplines.each do |race_discipline|
      th class="discipline-#{race_discipline.discipline!.name}" = race_discipline.discipline!.title
    th = "Итог"

  - results.to_a.each_with_index do |result, i|
    tr
      td rowspan="3" = i + 1
      td rowspan="3" = result.user!.name
      td rowspan="3" = result.user!.team!.name
      td rowspan="3" = result.user!.year
      - result.result_race_disciplines.each do |result_race_discipline|
        td class="discipline-#{result_race_discipline.race_discipline!.discipline!.name}" = result_race_discipline.time
      td rowspan="3" = all_time result.result_race_disciplines

    tr
      - result.result_race_disciplines.each do |result_race_discipline|
        td class="discipline-#{result_race_discipline.race_discipline!.discipline!.name}" = result_race_discipline.race_discipline!.distance_format

    tr
      - result.result_race_disciplines.each do |result_race_discipline|
        td class="discipline-#{result_race_discipline.race_discipline!.discipline!.name}" = result_race_discipline.speed
