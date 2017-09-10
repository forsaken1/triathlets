class RaceDiscipline < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    race_id: {type: Int32, null: true},
    discipline_id: {type: Int32, null: true},
    position: {type: Int32, null: true},
    distance: {type: Float32, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  belongs_to :discipline, Discipline
end
