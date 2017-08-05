require "jennifer/adapter/postgres"
require "jennifer"
require "../config/jennifer"
require "../src/models/*"

Result.all.delete
User.all.delete
Race.all.delete
Team.all.delete

team = Team.create name: "Лично"
user = User.create name: "Ivan Ivanov", team_id: team.id
race = Race.create title: "Sprint triathlon", transits: true
result = Result.create user_id: user.id, race_id: race.id
