class ResultDiscipline < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    result_id: {type: Int32, null: true},
    discipline_id: {type: Int32, null: true},
    position: {type: Int32, null: true},
    time: {type: String, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  belongs_to :discipline, Discipline
end
