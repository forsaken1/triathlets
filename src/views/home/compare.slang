h1 = "Сравнение"

.users-comparison-container
  - users.each do |user|
    .users-comparison-item
      h2 = user.name
      .users-comparison-results
        - user.results.each do |result|
            .users-comparison-result
              .line
                = result.race!.title
              .line
                = result.time

css:
  .wide {
    width: 95%;
  }      
