class RacePresenter
  getter :time

  def initialize(@race : Race, @time : String | Nil)
  end

  delegate :id, :title, :date, to: @race
end
