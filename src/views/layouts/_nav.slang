- @main_menu.as(MainMenu).items.each do |path, name|
  a class="nav-item #{context.request.path == path ? "active" : ""}" href=path = name
