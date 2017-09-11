class ResultRaceDiscipline < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    result_id: Int32,
    race_discipline_id: Int32,
    position: {type: Int32, null: true},
    time: {type: String, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  belongs_to :race_discipline, RaceDiscipline
end
