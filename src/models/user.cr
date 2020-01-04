class User < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    name: String,
    qualification: {type: String, null: true},
    year: {type: Int32, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  has_many :races, Race

  def self.search(name)
    all.find_by_sql "SELECT users.* FROM users WHERE users.name ILIKE $1 ORDER BY users.name COLLATE \"C\"", ["%#{name}%"]
  end

  def self.by_team_id(team_id)
    all.find_by_sql "SELECT users.* FROM users JOIN results ON results.user_id = users.id WHERE results.team_id = $1 GROUP BY users.id", [team_id]
  end
end
