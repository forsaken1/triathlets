require "jennifer/adapter/postgres"
require "jennifer"
require "../config/jennifer"
require "../src/models/*"

User.all.delete
Team.all.delete
team = Team.create name: "Лично"
User.create name: "Ivan Ivanov", team_id: team.id