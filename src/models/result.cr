class Result < Jennifer::Model::Base
  with_timestamps
  mapping(
    id: {type: Int32, primary: true},
    user_id: Int32,
    race_id: Int32,
    city_id: Int32,
    team_id: Int32,
    group_id: {type: Int32, null: true},
    time: {type: String, null: true},
    position: {type: Int32, null: true},
    created_at: {type: Time, null: true},
    updated_at: {type: Time, null: true}
  )

  belongs_to :user, User
  belongs_to :race, Race
  belongs_to :city, City
  belongs_to :team, Team
  belongs_to :group, Group

  has_many :result_race_disciplines, ResultRaceDiscipline, {order(position: :asc)}

  scope :by_race_id { |race_id| where { _race_id == race_id } unless race_id.nil? }

  def time_format
    time.nil? ? "DNF" : time
  end

  def as_json
    {
      id:    id,
      user:  user!.as_json,
      city:  city!.as_json,
      team:  team!.as_json,
      group: group ? group!.as_json : nil,
      time:  time,
    }
  end
end
