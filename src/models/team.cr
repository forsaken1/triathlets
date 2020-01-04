class Team < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    name: String,
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  def self.search(name)
    all.find_records_by_sql "SELECT teams.*, COUNT(users.*) as count
      FROM teams, LATERAL(SELECT DISTINCT results.user_id FROM results WHERE results.team_id = teams.id) users
      WHERE teams.name ILIKE $1 AND teams.name != 'Лично'
      GROUP BY teams.id
      ORDER BY count DESC", ["%#{name}%"]
  end
end
