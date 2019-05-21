a class="nav-item #{context.request.path == "/admin" ? "active" : ""}" href="/admin" = "Панель управления"
a class="nav-item #{context.request.path.starts_with?("/admin/races") ? "active" : ""}" href="/admin/races" = "Триатлоны"
