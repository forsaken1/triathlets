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
    - race_disciplines.each_with_index do |race_discipline, i|
      th class="discipline-#{race_discipline.discipline!.name}"
        a href="#{race_path(race, group_id: params["group_id"]? && params["group_id"], order: order == "asc" && params["position"]? ? "desc" : "asc", position: i.to_s)}" = race_discipline.discipline!.title
          == sort_icon i
        br
        = race_discipline.distance_format
    th
      a href="#{race_path(race, group_id: params["group_id"]? && params["group_id"], order: order == "asc" && !params["position"]? ? "desc" : "asc")}" = "Итог"
        == sort_icon nil

  - results.to_a.each_with_index do |result, i|
    tr
      td rowspan="2" = i + 1
      td rowspan="2" = users[result.user_id].name
      td rowspan="2" = teams[result.team_id].name
      td rowspan="2" = cities[result.city_id].name
      td rowspan="2" = users[result.user_id].year
      - result_race_disciplines.select { |o| o.result_id == result.id }.each do |result_race_discipline|
        td class="discipline-#{race_disciplines_hash[result_race_discipline.race_discipline_id].discipline!.name}" = result_race_discipline.time_format
      td rowspan="2" = result.time_format

    tr
      - result_race_disciplines.select { |o| o.result_id == result.id }.each do |result_race_discipline|
        td class="discipline-#{race_disciplines_hash[result_race_discipline.race_discipline_id].discipline!.name}" = result_race_discipline.speed(race_disciplines_hash[result_race_discipline.race_discipline_id])

css:
  .wide {
    width: 95%;
  }
