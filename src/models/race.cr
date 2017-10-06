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
  has_many :race_disciplines, RaceDiscipline, { order(position: :asc) }

  scope :ordered { order date: "asc" }
end
