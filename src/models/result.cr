class Result < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    title: String,
    description: String,
    transits: Bool,
    disciplines: JSON::Any,
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )
end
