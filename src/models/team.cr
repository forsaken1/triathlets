class Team < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    name: String,
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  def self.search(name)
    search_by_sql "SELECT teams.* FROM teams WHERE teams.name ILIKE '%#{name}%'"
  end
end
