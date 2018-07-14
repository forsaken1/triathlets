class Team < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    name: String,
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  scope :search { |name| where { _name.like("%#{name}%") } }
end
