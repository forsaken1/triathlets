h1 = "Сравнение"

.users-comparison-container
  - users.each do |user|
    .user-comparison-container
      h2 = user.name
      .user-comparison-results
        - user.results.each do |result|
            .user-comparison-result
              .row
                = result.race!.title
              .row
                = result.time

css:
  .wide {
    width: 95%;
  }      
