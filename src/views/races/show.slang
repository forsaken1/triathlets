h2 = race.title

ul.nav.nav-tabs
  li class="#{params["group_id"]? ? "" : "active"}"
    a href=race_path(race) = "Абсолют"
  - groups.each do |group|
    li class="#{active?(group) ? "active" : ""}"
      a href="#{race_path(race, group_id: group.id.to_s)}" = group.name

table.table.table-striped
  tr
    th #
    th = "Имя"
    th = "Команда"
    th = "Город"
    th = "Год"
    - race_disciplines.to_a.each_with_index do |race_discipline, i|
      th class="discipline-#{race_discipline.discipline!.name}"
        a href="#{race_path(race, group_id: params["group_id"]? && params["group_id"], order: order == "asc" && params["position"]? ? "desc" : "asc", position: i.to_s)}" = race_discipline.discipline!.title
        br
        = race_discipline.distance_format
    th
      a href="#{race_path(race, group_id: params["group_id"]? && params["group_id"], order: order == "asc" && !params["position"]? ? "desc" : "asc")}" = "Итог"

  - results.to_a.each_with_index do |result, i|
    tr
      td rowspan="2" = i + 1
      td rowspan="2" = result.user!.name
      td rowspan="2" = result.team!.name
      td rowspan="2" = result.city!.name
      td rowspan="2" = result.user!.year
      - result.result_race_disciplines.each do |result_race_discipline|
        td class="discipline-#{result_race_discipline.race_discipline!.discipline!.name}" = result_race_discipline.time
      td rowspan="2" = result.time

    tr
      - result.result_race_disciplines.each do |result_race_discipline|
        td class="discipline-#{result_race_discipline.race_discipline!.discipline!.name}" = result_race_discipline.speed

css:
  .wide {
    width: 95%;
  }
