class RaceDiscipline < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    race_id: Int32,
    discipline_id: Int32,
    distance: Float32,
    position: {type: Int32, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  belongs_to :discipline, Discipline

  def distance_format
    case discipline!.name
    when "swim"
      "#{(distance * 1000).to_i} м"
    when "bicycle", "run"
      "#{distance.to_i} км"
    else
      "-"
    end
  end
end
