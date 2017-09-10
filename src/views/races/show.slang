h2 = race.title

table class="table table-striped"
  tr
    th #
    th = "Имя"
    th = "Команда"
    th = "Год"
    - race.race_disciplines.each do |race_discipline|
      th class="discipline-#{race_discipline.discipline!.name}" = race_discipline.discipline!.name

  - race.results.each_with_index do |result, i|
    tr
      td = i + 1
      td = result.user!.name
      td = result.user!.team!.name
      td = result.user!.year
      - result.result_disciplines.each do |result_discipline|
        td class="discipline-#{result_discipline.discipline!.name}" = result_discipline.time
