class Result < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    user_id: {type: Int32, null: true},
    group_id: {type: Int32, null: true},
    race_id: {type: Int32, null: true},
    position: {type: Int32, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  belongs_to :user, User
  belongs_to :race, Race

  has_many :result_disciplines, ResultDiscipline
end