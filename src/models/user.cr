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
    # search_by_sql "SELECT users.* FROM users WHERE users.name ILIKE '%#{name}%'"
  end
end
