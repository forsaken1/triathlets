h2 Triathlets

div
  - races.each do |race|
    h3 = race.title
    table class="table table-striped"
      tr
        th #
        th = "Имя"
        th = "Команда"
        th = "Год"
        th class="discipline-swim" = "Плавание"
        th class="discipline-transit" = "Транзитка 1"
        th class="discipline-bicycle" = "Велосипед"
        th class="discipline-transit" = "Транзитка 2"
        th class="discipline-run" = "Бег"

      - race.results.each_with_index do |result, i|
        tr
          td = i + 1
          td = result.user.not_nil!.name
          td = result.user.not_nil!.team.not_nil!.name
          td = result.user.not_nil!.year
          td class="discipline-swim" 21:23
          td class="discipline-transit" 01:54
          td class="discipline-bicycle" 39:09
          td class="discipline-transit" 00:46
          td class="discipline-run" 24:43
