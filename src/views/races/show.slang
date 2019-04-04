h2 = results_table.race.title

.container.best
  .row
    - if best.swim?
      .col-lg-3
        .item
          h3 = "Лучший пловец"
          h4 = best.swimmer.name
          p = best.swimmer_time
          p = best.swimmer_speed
    - if best.bicycle?
      .col-lg-3
        .item
          h3 = "Лучший велосипедист"
          h4 = best.bicyclist.name
          p = best.bicyclist_time
          p = best.bicyclist_speed
    - if best.run?
      .col-lg-3
        .item
          h3 = "Лучший бегун"
          h4 = best.runner.name
          p = best.runner_time
          p = best.runner_speed
    - if best.transit?
      .col-lg-3
        .item
          h3 = "Лучшая транзитка"
          h4 = best.transit_name
          p = best.transit_time

ul.nav.nav-tabs
  li class="#{params["group_id"]? ? "" : "active"}"
    a href=race_path(results_table.race) = "Абсолют"
  - results_table.groups.each do |group|
    li class="#{active?(group) ? "active" : ""}"
      a href="#{race_path(results_table.race, group_id: group.id.to_s)}" = group.name

.results
  table.table.table-striped
    tr
      th #
      th = "Имя"
      th = "Команда"
      th = "Город"
      th = "Год"
      - results_table.race_disciplines.each_with_index do |race_discipline, i|
        th class="discipline-#{race_discipline.discipline!.name}"
          a href="#{race_path(results_table.race, group_id: params["group_id"]? && params["group_id"], order: results_table.order == "asc" && params["position"]? ? "desc" : "asc", position: i.to_s)}" = race_discipline.discipline!.title
            == sort_icon i
          br
          = race_discipline.distance_format
      th
        a href="#{race_path(results_table.race, group_id: params["group_id"]? && params["group_id"], order: results_table.order == "asc" && !params["position"]? ? "desc" : "asc")}" = "Итог"
          == sort_icon nil

    - results_table.results.to_a.each_with_index do |result, i|
      tr
        td rowspan="2" = i + 1
        td rowspan="2"
          a href=user_path(results_table.users[result.user_id])
            = results_table.users[result.user_id].name
        td rowspan="2"
          a href=team_path(results_table.teams[result.team_id])
            = results_table.teams[result.team_id].name
        td rowspan="2" = results_table.cities[result.city_id].name
        td rowspan="2" = results_table.users[result.user_id].year
        - results_table.result_race_disciplines.select { |o| o.result_id == result.id }.each do |result_race_discipline|
          td class="discipline-#{results_table.race_disciplines_hash[result_race_discipline.race_discipline_id].discipline!.name}" = result_race_discipline.time_format
        td rowspan="2" = result.time_format

      tr
        - results_table.result_race_disciplines.select { |o| o.result_id == result.id }.each do |result_race_discipline|
          td class="discipline-#{results_table.race_disciplines_hash[result_race_discipline.race_discipline_id].discipline!.name}" = result_race_discipline.speed(results_table.race_disciplines_hash[result_race_discipline.race_discipline_id])

css:
  .wide {
    width: 95%;
  }
