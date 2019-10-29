class Race < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    title: String,
    date: String,
    description: {type: String, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  has_many :results, Result
  has_many :race_disciplines, RaceDiscipline, {order(position: :asc)}

  scope :ordered { order date: "asc" }
  scope :ordered_by_date { order({"TO_TIMESTAMP(races.date, 'DD.MM.YYYY')" => "DESC"}) }

  def self.by_user_id(user_id, order = "ORDER BY TO_TIMESTAMP(results.time, 'HH24.MI.SS') ASC")
    all.find_by_sql "SELECT races.* FROM races JOIN results ON results.race_id = races.id WHERE results.user_id = $1 #{order}", [user_id]
  end
end
