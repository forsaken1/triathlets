class Race < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    title: String,
    description: {type: String, null: true},
    transits: {type: Bool, null: true},
    disciplines: {type: JSON::Any, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  has_many :results, Result
end
